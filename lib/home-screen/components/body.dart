import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color:Color(0xFF00704A),
        child:Padding(
            padding:const EdgeInserts.all(8.0),
            child:Column(
                children:[
                    crossAxisAlignment:crossAxisAlignment.start,
                    children:[
                        Text('It\'s a great day for coffee',style:TextStyle(
                            fontSize:25.0,

                        ),
                        ),
                        Categories(),
                    ],

                ],
            )
        )
    )
      
    );
  }
}

class Categories extends StatefulWidget {
  
  @override
  CategoriesState createState()=>CategoriesState();
class CategoriesState extends State<Categories>{

    List<String> categories = [
    'Hot Coffee',
    'Cold Coffee',
    'Hot Teas',
    'Hot Drinks',
    'Iced Teas',
    'Specials',
    ];
    int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:75.0,
        child:ListView.builder(
            scrollDirection:Axis.horizontal,
            itemCount:categories.length,
            itemBuilder:(context,index)=>buildCategory(index),
                return GestureDetector(
                    onTap:(){
                        setState((){
                            selectedIndex = index;
                        });
                    },
                    child:Text(
                        categories[index],
                        style:TextStyle(
                            fontSize:25.0,
                            fontWeight:selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                        ),
                    ),
                );
            },
        ),
      
    );
  }
}
widget buildCategory(int index){
    return Padding(
        padding:const EdgeInserts.symmetric(horizontal:20.0),
        child:Column(
            children:[
                Text(
                    categories[index],
                    style:TextStyle(
                        fontSize:25.0,
                        fontWeight:selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                    ),
                ),
                Container(
                    margin:EdgeInsets.only(top:5.0),
                    height:2.0,
                    width:30.0,
                    color:selectedIndex == index ? Colors.black : Colors.transparent,
                ),
            ],
        ),
    );
}
