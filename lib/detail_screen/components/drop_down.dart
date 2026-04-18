import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = 'Zero';

  @override
  Widget build(BuildContext context) {
    return buildDropDown(context);
  }

  DropdownButton<String> buildDropDown(BuildContext context) {
    bool isDefault = dropdownValue == 'Zero';
    Color activeColor = Theme.of(context).primaryColor;
    Color inactiveColor = Colors.black54;

    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(
        Icons.arrow_drop_down_circle_outlined,
        color: isDefault ? inactiveColor : activeColor,
      ),
      iconSize: 24.0,
      elevation: 16,
      style: TextStyle(
        color: isDefault ? inactiveColor : Colors.black,
        fontSize: 16,
        fontWeight: isDefault ? FontWeight.normal : FontWeight.w500,
      ),
      underline: Container(
        height: 2.0,
        color: isDefault ? inactiveColor.withValues(alpha: 0.3) : activeColor,
      ),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            dropdownValue = newValue;
          });
        }
      },
      items: <String>[
        'Zero',
        'One',
        'Two(+25c)',
        'Three(+50c)',
        'Four(+.75c)',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}