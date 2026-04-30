import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: [
          //1st tab
          Tab(icon: Icon(Icons.home)),

          //2nd tab
          Tab(icon: Icon(Icons.settings)),

          //3rd tab
          Tab(icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
