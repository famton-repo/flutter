import 'package:flutter/material.dart'; 
import 'package:famton_app/models/coffee.dart'; 
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/body.dart';

class DetailScreen extends StatelessWidget { 
  final Coffee coffee;
  const DetailScreen({super.key, required this.coffee});

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      backgroundColor: coffee.bgcolor, 
      appBar: AppBar( 
        backgroundColor: coffee.bgcolor, 
        elevation: 0.0, 
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: const Icon(
            Icons.arrow_back, 
            color: Colors.white,
          ),
        ),
      ),
      body: Body(coffee: coffee), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 50,
        child: FloatingActionButton.extended(
          onPressed: () { 
            Navigator.pop(context);
            debugPrint('Added ${coffee.name} to cart'); 
          },
          label: Text('Add to cart (\$${coffee.price})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          icon: const FaIcon(FontAwesomeIcons.mugSaucer),
          backgroundColor: coffee.bgcolor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }
}
