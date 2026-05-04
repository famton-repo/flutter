import 'package:famton_app/models/cart_item.dart';
import 'package:famton_app/models/restaurant.dart';
import 'package:famton_app/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurant = context.watch<Restaurant>();
    final cart = restaurant.cart;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        actions: [
          // Clear cart button
          if (cart.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: 'Clear cart',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Clear Cart'),
                    content:
                        const Text('Remove all items from your cart?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          restaurant.clearCart();
                          Navigator.pop(context);
                        },
                        child: const Text('Clear'),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
      body: cart.isEmpty
          ? _buildEmptyCart(context)
          : _buildCartList(context, restaurant, cart),
      bottomNavigationBar: cart.isEmpty
          ? null
          : _buildCheckoutBar(context, restaurant),
    );
  }

  // ── Empty state ────────────────────────────────────────────────────────────

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 16),
          Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add something delicious!',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }

  // ── Cart items list ────────────────────────────────────────────────────────

  Widget _buildCartList(
      BuildContext context, Restaurant restaurant, List<CartItem> cart) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: cart.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = cart[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Icon(
              Icons.fastfood,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          title: Text(
            item.food.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.selectedAddons.isNotEmpty)
                Text(
                  item.selectedAddons.map((a) => a.name).join(', '),
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              Text(
                '\$${item.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Decrease
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () => restaurant.removeFromCart(item),
              ),
              Text(
                '${item.quantity}',
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              // Increase
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () =>
                    restaurant.addToCart(item.food, item.selectedAddons),
              ),
            ],
          ),
        );
      },
    );
  }

  // ── Checkout bar ──────────────────────────────────────────────────────────

  Widget _buildCheckoutBar(BuildContext context, Restaurant restaurant) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Total
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 13,
                ),
              ),
              Text(
                '\$${restaurant.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          const SizedBox(width: 24),

          // Checkout button
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PaymentPage()),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
