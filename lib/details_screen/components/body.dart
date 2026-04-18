import 'package:famton_app/details_screen/components/counter.dart';
import 'package:famton_app/details_screen/components/dropdown.dart';
import 'package:famton_app/details_screen/components/main.dart';
import 'package:famton_app/details_screen/components/small_medium_large.dart';
import 'package:flutter/material.dart';
import 'package:famton_app/models/Coffee.dart';

class Body extends StatelessWidget {
  final Coffee coffee;
  const Body({Key? key, required this.coffee}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(coffee.description),
                      SizedBox(height: 10.0),
                      sizePicker(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Number of' + coffee.name + '\$:'),
                          Counter(),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Customizations',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Number of sugar backs:'), Dropdown()],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('pumps ofcreamer:'), Dropdown()],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('pumps of whipped cream:'), Dropdown()],
                      ),
                    ],
                  ),
                ),
                Main(coffee: coffee),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
