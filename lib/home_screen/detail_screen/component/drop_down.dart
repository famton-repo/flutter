import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String _selectedMilk = 'Whole Milk';

  static const List<String> _milkOptions = [
    'Whole Milk',
    'Oat Milk',
    'Almond Milk',
    'Soy Milk',
    'No Milk',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[50],
      ),
      child: DropdownButton<String>(
        value: _selectedMilk,
        isExpanded: true,
        underline: const SizedBox.shrink(),
        icon: const Icon(Icons.keyboard_arrow_down_rounded,
            color: Color(0xFF00704A)),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() => _selectedMilk = newValue);
          }
        },
        items: _milkOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF1B1B1B),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
