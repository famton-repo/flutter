import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //Dark Mode
          Text(
            "Dark Mode",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          CupertinoSwitch(value: false, onChanged: (value) {}),
        ],
      ),
    );
  }
}
