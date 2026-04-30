import 'package:famton_app/pages/Settings%20_page.dart';
import 'package:flutter/material.dart';

import 'my _drawer _tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(padding: const EdgeInsets.all(25.0)),
          Center(
            child: Divider(color: Theme.of(context).colorScheme.secondary),
          ),
          //home list tile
          MyDrawerTile(
            icon: Icons.home,
            text: "H O M E",
            onTap: () => Navigator.pop(context),
          ),
          //setting list tile
          MyDrawerTile(
            icon: Icons.settings,
            text: "S E T T I N G S",
            onTap: () => {
              // Navigator.pop(context).then(
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => SettingsPage()),
              //   ),
              // ),
            },
          ),
          const Spacer(),
          //logout list tile
          MyDrawerTile(icon: Icons.logout, text: "L O G O U T", onTap: () {}),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
