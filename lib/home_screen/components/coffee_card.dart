import 'package:flutter/material.dart';
import 'package:flutter_1/models/coffee.dart';


class CoffeeCard extends StatelessWidget {

  final Coffee coffee;
  final Function press;
  const CoffeeCard({ Key key, this.coffee,this.press}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap:press,
            child: Row(
              children:[
                padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Image.asset(
                    coffee.image,width:60.0,
                    ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}