import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 1;

  void _increment() => setState(() => _count++);
  void _decrement() => setState(() { if (_count > 1) _count--; });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildButton(icon: Icons.remove, onTap: _decrement),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '$_count',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B1B1B),
            ),
          ),
        ),
        _buildButton(icon: Icons.add, onTap: _increment),
      ],
    );
  }

  Widget _buildButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: const Color(0xFF00704A),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
