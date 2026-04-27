import 'package:famton_app/components/my_button.dart';
import 'package:famton_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class ResisterPage extends StatefulWidget {
  final void Function()? onTap;
  const ResisterPage({super.key, required this.onTap});

  @override
  State<ResisterPage> createState() => _ResisterPageState();
}

class _ResisterPageState extends State<ResisterPage> {
  // text edting controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
              "Let's create an account for you",
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
            const SizedBox(height: 10),
            // confirm password textfield
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obsecureText: true,
            ),
            const SizedBox(height: 10),
            MyButton(
              text: "sign up",
              onTap: () => {},
            ),
            const SizedBox(height: 25),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text(
                "Login now",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
            //message
          ],
        ),
      ),
    );
  }
}
