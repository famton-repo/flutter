import 'package:flutter/material.dart';

class sizePicker extends StatefulWidget {
  @override
  _sizePickerState createState() => _sizePickerState();
}

class _sizePickerState extends State<sizePicker> {
  List<String> sizes = ['Small','Medium', 'Large']; 
  int _selectedIndex = 1; 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: sizes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: sizes.length,
        ),
        itemBuilder: (context, index) => Container(),
      ),
    );
  }
}
