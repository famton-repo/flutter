import 'package:flutter/material.dart';
import 'package:famton/components/my_drawer.dart';
import 'package:famton/components/my_tab_bar.dart';
import 'package:famton/components/my_current_location.dart';
import 'package:famton/components/my_description_box.dart';
import 'package:famton/components/my_food_tile.dart';
import 'package:famton/models/food.dart';
import 'package:famton/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'package:famton/components/my_sliver_app_bar.dart';

import 'package:famton/pages/food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  // tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  // filter and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // get individual food
          final food = categoryMenu[index];

          // return food tile UI
          return MyFoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(
                  food: food,
                ), // MaterialPageRoute
              ),
            ),
          ); // food tile
        },
      ); // ListView.builder
    }).toList();
  }

@override
void dispose(){
    _tabController.dispose();
    super.dispose();
}

@override
Widget build (BuildContext context) {
  return Scaffold(
    drawer: const MyDrawer(),
    body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        MySliverAppBar(
          title: MyTabBar(tabController: _tabController),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                indent: 25,
                endIndent: 25,
                color: Theme.of(context).colorScheme.secondary,
              ),

              // My Current Location
              MyCurrentLocation(),

              // Description Box
              const MyDescriptionBox(),
            ],
          ),
        ),
      ],
      body: Consumer<Restaurant>(
        builder: (context, restaurant, child) => TabBarView(
          controller: _tabController,
          children: getFoodInThisCategory(restaurant.menu),
        ),
      ),
    ),
  );
}
}