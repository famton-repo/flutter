import 'package:flutter/material.dart';
import 'package:famton_app/models/coffee.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:famton_app/home_screen/detail_screen/component/body.dart';

class DetailScreen extends StatelessWidget {
  final Coffee coffee;
  const DetailScreen({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00704A),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: IconButton(
              icon: const Icon(Icons.person, size: 30, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Body(coffee: coffee),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF00704A),
        onPressed: () {},
        icon: const FaIcon(FontAwesomeIcons.cartShopping, color: Colors.white),
        label: const Text(
          'Add to Cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
