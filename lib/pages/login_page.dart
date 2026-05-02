import 'package:famton_app/components/my_button.dart';
import 'package:famton_app/components/my_textfiled.dart';
import 'package:famton_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  //login method
  void login() {
    /*
fill out authentication here...
    */

    //navigate to home page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 25),
            // message, app slogan
            Text(
              "Food Delivery App",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 25),

            // Email Field
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obsecureText: false,
            ),
            const SizedBox(height: 10),
            // Password Field
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obsecureText: true,
            ),
            const SizedBox(height: 10),
            // Login Button
            MyButton(onTap: login, text: "Sign In"),

            const SizedBox(height: 25),
            // Register Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not A Member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
