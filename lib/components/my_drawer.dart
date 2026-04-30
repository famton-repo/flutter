import 'package:famton_app/components/my_drawer_title.dart';
import 'package:famton_app/pages/settings_page.dart';
import 'package:flutter/material.dart';

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
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(padding:const EdgeInsets.all(25.0),
          child: Divider(
            color: Theme.of(context).colorScheme.secondary,
            thickness: 1,
          ) 
          ),
          // home list tile
          MyDrawerTile(
            icon: Icon(Icons.home),
             text: "H O M E", 
             onTap: () =>Navigator.pop(context),
            ),
             const SizedBox(height: 10),
             MyDrawerTile(
            icon: Icon(Icons.settings),
             text: "S E T T I N G S", 
             onTap: (){
     Navigator.pop(context);
     Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
             },
             ),
      const Spacer(),

      MyDrawerTile(
            icon: Icon(Icons.logout),
             text: "L O G O U T", 
             onTap: (){

             },),

       const SizedBox(height: 25),   
          
          
        ],
      ),
    );
  }
}