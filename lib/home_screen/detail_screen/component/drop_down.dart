import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = 'zero';
  @override
  Widget build(BuildContext context) {
    return buildDropDown(context);
  }

  DropdownButton<String> buildDropDown(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['zero', 'one', 'two', 'three']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          })
          .toList(),
    );
  }
}
