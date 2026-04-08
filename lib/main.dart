import  'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}           


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         title:'Coffee Shop',
         debugShowCheckedModeBanner: false,
         theme: ThemeData(
          primarySwatch: Colors.brown,
          visualDensity: VisualDensity.adaptivePlatformDensity,

         ),
         home: HomeScreen(),
          appBar: AppBar(
            title: Text('Coffee Shop'),
          ),
          body: Center(
            child: Text('Coffee Shop'),
          ),
         ),

    );
  }
}
