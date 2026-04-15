import 'package:flutter/material.dart';

class SmallMediumLarge extends StatefulWidget {
  const SmallMediumLarge({super.key});

  @override
  State<SmallMediumLarge> createState() => _SmallMediumLargeState();
}

class _SmallMediumLargeState extends State<SmallMediumLarge> {
  String _selected = 'M';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ['S', 'M', 'L'].map((size) {
        final isSelected = _selected == size;
        return GestureDetector(
          onTap: () => setState(() => _selected = size),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(right: 12),
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF00704A) : Colors.grey[100],
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isSelected ? const Color(0xFF00704A) : Colors.grey[300]!,
                width: 1.5,
              ),
            ),
            child: Center(
              child: Text(
                size,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.grey[600],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
