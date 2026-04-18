import 'package:flutter/material.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

    @override
    Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF00704A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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