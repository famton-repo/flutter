import 'package:flutter/material.dart';
import 'package:famton_app/models/coffee.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:famton_app/home_screen/detail_screen/component/body.dart'
    as detail;

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
      body: detail.Body(coffee: coffee),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
           Navigator.pop(context);
           print('Added ' + coffee.name + ' to cart');
        },
        label: Text('Add to cart (\$${coffee.price})', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        icon: const FaIcon(FontAwesomeIcons.mugHot, color: Colors.white),
        backgroundColor: coffee.bgColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
