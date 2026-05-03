import 'package:famton_app/components/my_current_location.dart';
import 'package:famton_app/components/my_description_box.dart';
import 'package:famton_app/components/my_tab_bar.dart';
import 'package:famton_app/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:famton_app/components/my_drawer.dart';
import 'package:famton_app/components/my_sliver_app.dart';
import 'package:famton_app/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                // switch address
                MyCurrentLocation(),
                // description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index)=>Text("first tab items"),
              ),
              ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index)=>Text("second tab items"),
              ),
              ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index)=>Text("third tab items"),
              ),

            
          ],
        ),
      ),
    );
  }
}
