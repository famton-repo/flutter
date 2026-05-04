import 'package:famton_app/auth/auth_service.dart';
import 'package:famton_app/components/my_drawer_title.dart';
import 'package:famton_app/components/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void _logout(BuildContext context) {
    Navigator.pop(context); // close drawer first
    AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
            ),
          ),

          // home list tile
          MyDrawerTile(
            text: "H O M E",
            icon: const Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),

          const SizedBox(height: 10),

          // settings tile
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),

          const Spacer(),

          // logout tile
          MyDrawerTile(
            text: "L O G O U T",
            icon: const Icon(Icons.logout_rounded),
            onTap: () => _logout(context),
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
