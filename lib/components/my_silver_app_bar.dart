import 'package:flutter/material.dart';

class MySilverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySilverAppBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        //cart button
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
      ],
      backgroundColor: Theme.of(context).colorScheme.secondary,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Sunset Dinner'),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0, top: 0, right: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
