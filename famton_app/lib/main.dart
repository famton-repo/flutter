import 'package:flutter/material.dart';
import 'package:famton_app/screen/fetchdatafromapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Famton App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
        cardTheme: const CardThemeData(
          elevation: 3,
          shadowColor: Colors.black12,
        ),
      ),
      home: const UserListScreen(),
    );
  }
}
