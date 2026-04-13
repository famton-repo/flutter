import 'package:flutter/material.dart';
import 'package:flutter_1/home_screen/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors(0*FF00704A),
        elevation: 0.0,
        actions: [
          padding(
            padding:const EdgeInsets.fromLTRB(0, 0, 12.0, 0),
            child: IconButton(
              icon: Icon(
                Icons.persons),
              size:35.0,
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body:Body(),
      
    );
  }
}