import 'package:famton_app/home%20_screen/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 223, 180, 209),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 12.0, 0),
            child: IconButton(
              icon: Icon(Icons.person, size: 35.0, color: Colors.white),
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
