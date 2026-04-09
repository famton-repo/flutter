import 'package:flutter/material.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return Scaffold(
           appBar: AppBar(
         backgroundColor: Colors.green[800],
         elevation: 0.0,
         actions: [ 
            Padding( 
            padding: const EdgeInsets.fromLTRB(0, 0, 12.0, 0), 
            child: IconButton( 
                icon: Icon( 
                    Icons.person, 
                    size: 35.0, 
                    ), // Icon 
                onPressed: () => {}, 
                ), // IconButton 
            ),// Padding
          ],  
        ), // AppBar
     body: Body(),
     );
    }
}