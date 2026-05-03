import 'package:famton_app/models/food.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key, required this.tabController});

  final TabController tabController;

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((Category) {
      return Tab(text: Category.toString().split('.').last);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(controller: tabController, tabs: _buildCategoryTabs()),
    );
  }
}
