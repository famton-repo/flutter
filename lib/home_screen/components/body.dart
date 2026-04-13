import 'package:flutter/material.dart';
import 'package:flutter_1/home_screen/components/coffee_card.dart';
import 'package:flutter_1/models/coffee.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:color(0*FF00704A),
      child:padding(
        padding:const EdgeInsets.all(8.0),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "It's a great day for coffee!",
            style: TextStyle(fontSize:25.0)
              ),
              Categories(),
              Expanded(
                child:ListView.builder(
                  itemCount:coffeeList.length,
                  scrollDirection:Axis.vertical,
                  itemBuilder:(context,index)=>CoffeeCard(
                    coffee:coffeeList[index],
                  )
                )
              )
        ],
    ),
      ),
    );
  }
}


class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Hot Coffees",
    "Cold Coffees",
    "Hot Teas",
    "Hot Drinks",
    "Iced teas",
    "Specials",
    ];
    int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:75.0,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context,index)=>buildCategory(index),
        
      ),
    );
  }

  Widget buildCategory(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child:Padding(
        padding:const EdgeInsets.fromLTRB(0.0,20.0,15.0,0.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color:
                selectedIndex == index ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: selectedIndex == index ? Colors.black : Colors(0*FF27251F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}