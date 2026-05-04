import 'package:famton_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage>
    with SingleTickerProviderStateMixin {
  // Delivery steps
  final List<_DeliveryStep> _steps = [
    _DeliveryStep(icon: Icons.receipt_long, label: 'Order Placed'),
    _DeliveryStep(icon: Icons.kitchen, label: 'Preparing'),
    _DeliveryStep(icon: Icons.delivery_dining, label: 'On the Way'),
    _DeliveryStep(icon: Icons.home, label: 'Delivered'),
  ];

  int _currentStep = 0;
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    // Auto-advance steps to simulate delivery progress
    _advanceSteps();
  }

  Future<void> _advanceSteps() async {
    for (int i = 1; i < _steps.length; i++) {
      await Future.delayed(const Duration(seconds: 3));
      if (mounted) setState(() => _currentStep = i);
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool delivered = _currentStep == _steps.length - 1;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Delivery Progress'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            // ── Animated delivery icon ──────────────────────────────────────
            const SizedBox(height: 24),
            AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                return Transform.scale(
                  scale: delivered ? 1.0 : 0.9 + _pulseController.value * 0.1,
                  child: child,
                );
              },
              child: CircleAvatar(
                radius: 54,
                backgroundColor:
                    Theme.of(context).colorScheme.inversePrimary.withOpacity(0.12),
                child: Icon(
                  delivered ? Icons.check_circle : Icons.delivery_dining,
                  size: 64,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Status text
            Text(
              delivered ? '🎉 Your order has arrived!' : _steps[_currentStep].label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              delivered
                  ? 'Enjoy your meal!'
                  : 'Estimated delivery: 20 – 30 min',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),

            const SizedBox(height: 40),

            // ── Stepper ─────────────────────────────────────────────────────
            Row(
              children: List.generate(_steps.length * 2 - 1, (i) {
                if (i.isOdd) {
                  // Connector line
                  final stepIndex = i ~/ 2;
                  final completed = stepIndex < _currentStep;
                  return Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 3,
                      color: completed
                          ? Theme.of(context).colorScheme.inversePrimary
                          : Theme.of(context).colorScheme.secondary,
                    ),
                  );
                }

                final stepIndex = i ~/ 2;
                final completed = stepIndex <= _currentStep;
                return Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: completed
                            ? Theme.of(context).colorScheme.inversePrimary
                            : Theme.of(context).colorScheme.secondary,
                      ),
                      child: Icon(
                        _steps[stepIndex].icon,
                        size: 22,
                        color: completed
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context)
                                .colorScheme
                                .inversePrimary
                                .withOpacity(0.4),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _steps[stepIndex].label,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: completed
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }),
            ),

            const Spacer(),

            // ── Back to home (only when delivered) ─────────────────────────
            if (delivered)
              GestureDetector(
                onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                  (route) => false,
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      'Back to Home',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.background,
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
}

class _DeliveryStep {
  final IconData icon;
  final String label;
  const _DeliveryStep({required this.icon, required this.label});
}
