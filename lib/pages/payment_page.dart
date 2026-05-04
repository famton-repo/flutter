import 'package:famton_app/models/restaurant.dart';
import 'package:famton_app/pages/delivery_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _addressController = TextEditingController();
  String _selectedMethod = 'Credit Card';
  bool _isPlacing = false;

  final List<String> _paymentMethods = [
    'Credit Card',
    'Debit Card',
    'Cash on Delivery',
    'Digital Wallet',
  ];

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _placeOrder(BuildContext context) async {
    if (_addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a delivery address.')),
      );
      return;
    }

    setState(() => _isPlacing = true);

    // Simulate a brief network/processing delay
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    context.read<Restaurant>().clearCart();

    setState(() => _isPlacing = false);

    // Navigate to delivery progress, removing all previous routes
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const DeliveryProgressPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = context.watch<Restaurant>();
    final cart = restaurant.cart;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Order summary ─────────────────────────────────────────────
            _sectionTitle(context, 'Order Summary'),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  ...cart.map(
                    (item) => ListTile(
                      title: Text(
                        '${item.quantity}x  ${item.food.name}',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      trailing: Text(
                        '\$${item.totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: const Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '\$${restaurant.totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── Delivery address ──────────────────────────────────────────
            _sectionTitle(context, 'Delivery Address'),
            const SizedBox(height: 10),
            TextField(
              controller: _addressController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: 'Enter your full delivery address…',
                prefixIcon: const Icon(Icons.location_on_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Theme.of(context)
                    .colorScheme
                    .secondary
                    .withOpacity(0.1),
              ),
            ),

            const SizedBox(height: 24),

            // ── Payment method ────────────────────────────────────────────
            _sectionTitle(context, 'Payment Method'),
            const SizedBox(height: 10),
            ...(_paymentMethods.map(
              (method) => RadioListTile<String>(
                title: Row(
                  children: [
                    Icon(_methodIcon(method)),
                    const SizedBox(width: 10),
                    Text(method),
                  ],
                ),
                value: method,
                groupValue: _selectedMethod,
                onChanged: (v) => setState(() => _selectedMethod = v!),
              ),
            )),

            const SizedBox(height: 32),

            // ── Place order button ─────────────────────────────────────────
            GestureDetector(
              onTap: _isPlacing ? null : () => _placeOrder(context),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: _isPlacing
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: _isPlacing
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(
                          'Place Order  •  \$${restaurant.totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).colorScheme.background,
                          ),
                        ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }

  IconData _methodIcon(String method) {
    switch (method) {
      case 'Credit Card':
        return Icons.credit_card;
      case 'Debit Card':
        return Icons.payment;
      case 'Cash on Delivery':
        return Icons.money;
      case 'Digital Wallet':
        return Icons.account_balance_wallet_outlined;
      default:
        return Icons.payment;
    }
  }
}
