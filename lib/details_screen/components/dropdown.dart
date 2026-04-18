import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = 'zero';

  @override
  Widget build(BuildContext context) {
    return buildDropDown(context);
  }

  DropdownButton<String> buildDropDown(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(
        Icons.arrow_downward,
        color: dropdownValue != 'zero' ? Colors.black : Colors.black54,
      ),
      iconSize: 20.0,
      elevation: 16,
      style: TextStyle(
        color: dropdownValue != 'zero' ? Colors.black : Colors.black54,
      ),
      underline: Container(
        height: 2.0,
        color: dropdownValue != 'zero' ? Colors.black : Colors.black54,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items:
          <String>[
            'zero',
            'one',
            'two(+0.25)',
            'three(+0.50)',
            'four(+0.75)',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
    );
  }
}
