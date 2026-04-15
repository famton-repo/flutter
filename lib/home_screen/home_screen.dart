import 'package:famton_app/home_screen/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00704A),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: IconButton(
              icon: const Icon(Icons.person, size: 30, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
