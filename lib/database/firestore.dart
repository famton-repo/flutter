import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:famton_app/models/cart_item.dart';

/// A service class that wraps all Cloud Firestore interactions for the app.
///
/// Collections used:
///   users/{uid}                     – user profile documents
///   users/{uid}/orders/{orderId}    – per-user order history
///   reviews/{reviewId}              – public restaurant reviews
class FirestoreService {
  // ─── Firestore & Auth instances ────────────────────────────────────────────

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ─── Helpers ───────────────────────────────────────────────────────────────

  /// The currently signed-in user's UID. Throws if not authenticated.
  String get _uid {
    final user = _auth.currentUser;
    if (user == null) throw Exception('No user is currently signed in.');
    return user.uid;
  }

  // ══════════════════════════════════════════════════════════════════════════
  // U S E R   P R O F I L E
  // ══════════════════════════════════════════════════════════════════════════

  /// Save (or overwrite) the user's profile document.
  Future<void> saveUserProfile({
    required String name,
    required String email,
    String phone = '',
    String address = '',
  }) async {
    await _db.collection('users').doc(_uid).set({
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  /// Stream that emits the current user's profile whenever it changes.
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserProfileStream() {
    return _db.collection('users').doc(_uid).snapshots();
  }

  /// Fetch the user's profile once (non-streaming).
  Future<Map<String, dynamic>?> getUserProfile() async {
    final doc = await _db.collection('users').doc(_uid).get();
    return doc.data();
  }

  // ══════════════════════════════════════════════════════════════════════════
  // O R D E R S
  // ══════════════════════════════════════════════════════════════════════════

  /// Save a completed order to Firestore under the signed-in user's sub-collection.
  ///
  /// Returns the auto-generated order document ID.
  Future<String> placeOrder({
    required List<CartItem> cartItems,
    required double totalPrice,
    required String deliveryAddress,
  }) async {
    // Build a serialisable list of order line items.
    final List<Map<String, dynamic>> items = cartItems.map((item) {
      return {
        'foodName': item.food.name,
        'foodCategory': item.food.category.name,
        'imagePath': item.food.imagePath,
        'unitPrice': item.food.price,
        'quantity': item.quantity,
        'selectedAddons': item.selectedAddons
            .map((a) => {'name': a.name, 'price': a.price})
            .toList(),
        'itemTotal': item.totalPrice,
      };
    }).toList();

    final orderRef = await _db
        .collection('users')
        .doc(_uid)
        .collection('orders')
        .add({
      'items': items,
      'totalPrice': totalPrice,
      'deliveryAddress': deliveryAddress,
      'status': 'pending',   // pending | preparing | on_the_way | delivered
      'placedAt': FieldValue.serverTimestamp(),
    });

    return orderRef.id;
  }

  /// Update the status of an existing order.
  ///
  /// [status] should be one of: 'pending', 'preparing', 'on_the_way', 'delivered'.
  Future<void> updateOrderStatus({
    required String orderId,
    required String status,
  }) async {
    await _db
        .collection('users')
        .doc(_uid)
        .collection('orders')
        .doc(orderId)
        .update({
      'status': status,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Real-time stream of all orders for the current user, newest first.
  Stream<QuerySnapshot<Map<String, dynamic>>> getOrdersStream() {
    return _db
        .collection('users')
        .doc(_uid)
        .collection('orders')
        .orderBy('placedAt', descending: true)
        .snapshots();
  }

  /// Fetch all orders for the current user once (non-streaming).
  Future<List<Map<String, dynamic>>> getOrders() async {
    final snapshot = await _db
        .collection('users')
        .doc(_uid)
        .collection('orders')
        .orderBy('placedAt', descending: true)
        .get();

    return snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
  }

  /// Fetch a single order by its document ID.
  Future<Map<String, dynamic>?> getOrderById(String orderId) async {
    final doc = await _db
        .collection('users')
        .doc(_uid)
        .collection('orders')
        .doc(orderId)
        .get();

    if (!doc.exists) return null;
    return {'id': doc.id, ...doc.data()!};
  }

  // ══════════════════════════════════════════════════════════════════════════
  // R E V I E W S
  // ══════════════════════════════════════════════════════════════════════════

  /// Post a public review to the top-level `reviews` collection.
  Future<void> addReview({
    required String reviewText,
    required double rating, // 1.0 – 5.0
  }) async {
    final user = _auth.currentUser;

    await _db.collection('reviews').add({
      'uid': _uid,
      'userName': user?.displayName ?? user?.email ?? 'Anonymous',
      'reviewText': reviewText,
      'rating': rating,
      'postedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Real-time stream of all reviews, newest first.
  Stream<QuerySnapshot<Map<String, dynamic>>> getReviewsStream() {
    return _db
        .collection('reviews')
        .orderBy('postedAt', descending: true)
        .snapshots();
  }

  /// Delete a review. Only the review's author can do this (enforce via
  /// Firestore Security Rules on the backend as well).
  Future<void> deleteReview(String reviewId) async {
    final doc = await _db.collection('reviews').doc(reviewId).get();
    if (doc.data()?['uid'] != _uid) {
      throw Exception('You can only delete your own reviews.');
    }
    await _db.collection('reviews').doc(reviewId).delete();
  }

  // ══════════════════════════════════════════════════════════════════════════
  // D E L I V E R Y   A D D R E S S
  // ══════════════════════════════════════════════════════════════════════════

  /// Save or update the user's saved delivery address.
  Future<void> saveDeliveryAddress(String address) async {
    await _db.collection('users').doc(_uid).set(
      {'address': address, 'updatedAt': FieldValue.serverTimestamp()},
      SetOptions(merge: true),
    );
  }

  /// Get the saved delivery address (once).
  Future<String?> getDeliveryAddress() async {
    final doc = await _db.collection('users').doc(_uid).get();
    return doc.data()?['address'] as String?;
  }
}
