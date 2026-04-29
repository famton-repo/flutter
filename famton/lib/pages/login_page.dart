import 'package:flutter/material.dart';
import 'package:famton/components/my_button.dart';
import 'package:famton/components/my_textfield.dart';
import 'package:famton/services/auth/auth_service.dart';


class LoginPage extends StatefulWidget { 
final void Function()? onTap;
const LoginPage({super.key, required this.onTap});
@override
State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
//text editing controller

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

//login method
void login() async{
 //get instance of auth service
 final _authService = AuthService();

// try sign in
try{
    await _authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
    );
}

//display any errors
catch(e){
     showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text(e.toString()),
        ),
        );
}
}

// forgot password
void forgetPw(){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text("User trapped forgot password.")
        ),
    );
}
@override Widget build (BuildContext context) {
return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.surface,
    body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         // logo 
        Icon(
         Icons.lock_open_rounded,
         size: 100, 
         color: Theme.of(context).colorScheme.inversePrimary, 
         ), // Icon 
        const SizedBox(height: 25),
        // message, app slogan 
        Text(
            "Food Delivery App", 
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
            ), // TextStyle 
        ), // Text 

       const SizedBox(height: 25), 
    
       // email textfield 
       MyTextField(
        controller: emailController,
        hintText: 'Email',
        obscureText: false,
       ), //TextField

       const SizedBox(height: 10),
    
         // password textfield
        MyTextField(
        controller: passwordController,
        hintText: 'Password',
        obscureText: true,
       ), //TextField
       
       const SizedBox(height: 25),

    // sign in button
    MyButton(
      text: 'Sign In',
      onTap: login,
    ), //MyButton

     const SizedBox(height: 25),

     // not a member? register now 
     Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text("Not a member?",
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary), //Textstyle
                ), //Text

            const SizedBox(width: 4),
            GestureDetector(
            onTap: widget.onTap,
            child: Text("Register now",
                         style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
                ), //Textstyle
                ), //Text
                ), //GestureDetector
        ],
        
     ), //Row
    ],
     ), // Column 
     ), // Center 
     );// Scaffold
 }
}