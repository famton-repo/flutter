import 'package:famton_app/model/screen/fetchdatafrom api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Famton App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SVTUserData(),
    );
  }
}
