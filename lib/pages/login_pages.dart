import 'package:famton_app/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:famton_app/components/my_textfield.dart';
import 'package:famton_app/pages/home_page.dart';

class Login_page extends StatelessWidget {
  final void Function()? onTap;
  // text edting controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

// login method
void Login() {
  if (emailController.text == "[EMAIL_ADDRESS]" && passwordController.text == "123456") {
    print("Login Success");
  } else {
    print("Login Failed");
  }
}
 // navigate to home page
 void navigateToHomePage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
} 

 Login_page({
  super.key,
 required this.onTap
 }
 );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),
            Text(
              "Food Delivery App",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),
            // email textfield
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obsecureText: false,
            ),
            const SizedBox(height: 10),
            // password textfield
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obsecureText: true,
            ),
            const SizedBox(height: 25),
            MyButton(
              text: "sign in",
              onTap: Login,

            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children:[
                Text("Not a member?",style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                ),
         const SizedBox(width: 4),
                Text("Register now",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
                )
              ]


            ),
            //message
          ],
        ),
      ),
    );
  }
}
