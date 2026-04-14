import 'package:famton_app/home_screen/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00704A),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 12.0, 0),
            child: IconButton(
              icon: Icon(Icons.person, size: 35.0),
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
