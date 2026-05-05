import 'package:famton_app/components/my_current_location.dart';
import 'package:famton_app/components/my_description_box.dart';
import 'package:famton_app/components/my_drawer.dart';
import 'package:famton_app/components/my_sliver_app.dart';
import 'package:famton_app/components/my_tab_bar.dart';
import 'package:famton_app/components/my_food_title.dart';
import 'package:famton_app/models/food.dart';
import 'package:famton_app/models/restaurant.dart';
import 'package:famton_app/pages/cart_page.dart';
import 'package:famton_app/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // One tab per FoodCategory
  final List<FoodCategory> _categories = FoodCategory.values;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Filter menu by category
  List<Food> _filteredMenu(Restaurant restaurant, FoodCategory category) {
    return restaurant.menu.where((f) => f.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = context.watch<Restaurant>();

    return Scaffold(
      drawer: const MyDrawer(),
      // Cart icon badge
      floatingActionButton: _CartFab(itemCount: restaurant.totalItemCount),
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
                MyCurrentLocation(),
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: _categories.map((category) {
            final items = _filteredMenu(restaurant, category);
            if (items.isEmpty) {
              return Center(
                child: Text(
                  'Nothing here yet!',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: items.length,
              itemBuilder: (context, index) => MyFoodTile(food: items[index]),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// ── Cart FAB ─────────────────────────────────────────────────────────────────

class _CartFab extends StatelessWidget {
  final int itemCount;
  const _CartFab({required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CartPage()),
      ),
      icon: Badge(
        isLabelVisible: itemCount > 0,
        label: Text('$itemCount'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.shopping_cart_outlined),
      ),
      label: const Text('Cart'),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      foregroundColor: Theme.of(context).colorScheme.secondary,
    ); 
  }
}
