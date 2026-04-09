import 'package:flutter/material.dart'; 
import 'package:my_flutter_app/model/coffee.dart';
import 'package:my_flutter_app/detail_screen/detail_screen.dart';
import 'coffiee_card.dart';
class Body extends StatelessWidget { 
    @override 
Widget build(BuildContext context) { 
    return Container( 
        color: Color(0xFF00704A), 
        child: Padding( 
            padding: const EdgeInsets.all(8.0), 
            child: Column( crossAxisAlignment: CrossAxisAlignment.start, 
            children: [ 
                Text( 'It\'s a great day for coffe!', 
                style: TextStyle(fontSize: 25.0), 
                ), // Text 
                Categories(), 
            Expanded( 
                child: ListView.builder( 
                    itemCount: coffeeList.length, 
                    scrollDirection: Axis.vertical, 
                    itemBuilder: (context, index) => CoffeeCard(
                        coffee: coffeeList [index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                    coffee: coffeeList[index],
                                ),
                            ),//MaterialPageRoute
                        ),
                    ), //coffeecard
                  ),//ListView.builder
                ),//expanded
            ],
            ), // Column 
        ), // Padding 
    ); // Container
        }
   }

   class Categories extends StatefulWidget { 
    @override 
    _CategoriesState createState() => _CategoriesState();
    }
    
     class _CategoriesState extends State<Categories> { 
        List<String> categories = [
            'Hot Coffees', 
            'Cold Coffees',
            'Hot Teas', 
            'Hot Drinks', 
            'Iced Teas', 
            'Specials',
         ];
        int selectedIndex = 0;
         @override 
        Widget build(BuildContext context) { 
            return SizedBox( 
             height: 75.0, 
             child: ListView.builder( 
                itemCount: categories.length,
                scrollDirection: Axis.horizontal, 
                itemBuilder: (context, index) => buildCategory(index),
                ),// ListView.builder
            );// SizedBox
        }
             Widget buildCategory(int index) { 
                return GestureDetector(
                onTap: () { 
                    setState(() { 
                        selectedIndex = index;
                    });
                },
        child: Padding( 
            padding: const EdgeInsets.fromLTRB(0.0, 20.0, 15.0, 0.0), 
            child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [ 
                    Container( 
                        padding: const EdgeInsets.all(10.0), 
                        decoration: BoxDecoration( 
                        color: 
                            selectedIndex == index ? Colors.white : Colors.transparent, 
                            borderRadius: BorderRadius.all( 
                                Radius.circular(10.0), 
                                ), // BorderRadius.all 
                                ), // BoxDecoration 
                                child: Text( 
                                    categories [index], 
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 15.0, 
                                        color: selectedIndex == index ? Colors.black : Color(0xFF27251F), 
                                     ), // TextStyle 
                                ), // Text 
                            ), // Container 
                          ],
                       ), // Column 
                    ), // Padding 
                ); // GestureDetector
        }
     }