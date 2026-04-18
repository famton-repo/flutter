import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key});

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  final List<String> sizes = ['Small', 'Medium', 'Large'];
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.0,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: sizes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: sizes.length,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) => buildSize(index),
      ),
    );
  }

  Widget buildSize(int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20.0, 15.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              width: 90.0,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFE1E4E8) : Colors.transparent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFFE1E4E8),
                ),
              ),
              child: Text(
                sizes[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.black : const Color(0xFF27251F),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}