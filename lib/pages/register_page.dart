import 'package:flutter/material.dart';
import 'package:famton/components/my_button.dart';
import 'package:famton/components/my_textfield.dart';
import 'package:famton/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
final void Function ()? onTap;
const RegisterPage({
super.key, required this.onTap,
});
@override
State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
//text editing controller

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();

// register method
void register() async{
  // get auth service
  final _authService = AuthService();

  // check if password match -> create user
  if (passwordController.text == confirmPasswordController.text){
    // try creating user
    try{
      await _authService.signUpWithEmailPassword(
        emailController.text, 
        passwordController.text
      );
    }

    // display any errors
    catch(e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ), //AlertDialog
      );
    }
  }
   // if password don't match -> show error
   else{
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!"),
        ), //AlertDialog
    );
   }
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
            "Let's create an account", 
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

       const SizedBox(height: 10),
    
         // confrim password textfield
        MyTextField(
        controller: confirmPasswordController,
        hintText: 'Confirm Password',
        obscureText: true,
       ), //TextField
       
       const SizedBox(height: 25),

    // sign up button
    MyButton(
      text: 'Sign Up',
      onTap: register,
    ), //MyButton

     const SizedBox(height: 25),

     // already have an account? login here
     Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text("already have an account?",
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary), //Textstyle
                ), //Text

            const SizedBox(width: 4),
            GestureDetector(
            onTap: widget.onTap,
            child: Text("Login now",
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