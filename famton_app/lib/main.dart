import 'package:flutter/material.dart';
import 'screen/fetchdatafromapi.dart'; // Imports the UserDetails screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Data Fetch Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // This displays the screen you just created
      home: const UserDetails(),
    );
  }
}
