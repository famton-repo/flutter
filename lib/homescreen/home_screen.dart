import 'package:famton_app/homescreen/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00704A),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: IconButton(
              icon: Icon(Icons.person, size: 30),
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
