import 'package:flutter/material.dart';
import 'package:famton_app/components/my_drawer.dart';
import 'package:famton_app/components/my_sliver_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>[
          MySliverAppBar(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(indent: 25,endIndent:25,color:Theme.of(context).colorScheme.secondary,
                ),

                
                // my current location


              ],
            ),
            title:Text('title'),

          ),
        ]
      ),
    );
  }
}
