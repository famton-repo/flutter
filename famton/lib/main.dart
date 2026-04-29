import 'package:famton/services/auth/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart'; 
import 'package:famton/themes/theme_provider.dart'; 
import 'package:provider/provider.dart'; 

import 'package:famton/models/restaurant.dart';

void main() async { 
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    
    runApp (
     MultiProvider(
        providers: [
          // theme provider
ChangeNotifierProvider(create: (context) => ThemeProvider()),

          // restaurant provider
ChangeNotifierProvider(create: (context) => Restaurant()),
        ],
        child: const MyApp(), 
      ), // MultiProvider
    );
}
class MyApp extends StatelessWidget {
 const MyApp({super.key}); 
@override Widget build(BuildContext context) {
return MaterialApp (
    debugShowCheckedModeBanner: false,
    home: const AuthGate(),
    theme: Provider.of<ThemeProvider>(context).themeData,
 ); // MaterialApp 
 } 
}
