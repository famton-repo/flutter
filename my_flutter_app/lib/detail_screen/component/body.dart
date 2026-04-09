import 'package:flutter/material.dart'; 
import 'package:my_flutter_app/model/coffee.dart'; 
import 'main.dart'; 
import 'small_medium_large.dart'; 
import 'counter.dart';
import 'drop_down.dart';  

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
                                        top: size.height * 0.2, 
                                        left: 20.0, right: 20.0, 
                                    ), // EdgeInsets.only 
                                    decoration: BoxDecoration( 
                                        color: Colors.white, 
                                        borderRadius: BorderRadius.only( 
                                            topLeft: Radius.circular(20.0), 
                                            topRight: Radius.circular(20.0), 
                                        ) // BorderRadius.only 
                                    ), // BoxDecoration 
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                        Text(coffee.description),
                                        SizedBox(
                                            height: 10.0,
                                        ),
                                        SizePicker(),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                                Flexible(child: Text('Number of ' + coffee.name + '\'s:')),
                                                Counter(),
                                            ],
                                        ),//Row
                                        SizedBox(
                                            height: 20.0
                                        ),
                                    Text(
                                        'Costomizations',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                    ),//Text
                                     SizedBox(
                                            height: 15.0
                                        ),//SizedBox
                                         Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                                Flexible(child: Text('Number of sugar packs:')),
                                                DropDown(),
                                            ],
                                        ),//Row
                                         Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                                Flexible(child: Text('Pumps of creamer:')),
                                                DropDown(),
                                            ],
                                        ),//Row
                                         Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                                Flexible(child: Text('Pumps of whipped cream:')),
                                                DropDown(),
                                            ],
                                        ),//Row
                                    ],
                                ),
                                 ), // Container
                                 Main(coffee: coffee), 
                            ],
                        ), // Stack 
                    ), // SizedBox 
                ],
            ), // Column 
         ); // SingleChildScrollView
    }
}