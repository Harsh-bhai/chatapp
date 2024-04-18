import "package:chatapp/components/my_button.dart";
import "package:chatapp/components/my_text_field.dart";
import "package:chatapp/services/auth/auth_service.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:provider/provider.dart";

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign in user
  void signIn() async {
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              const Icon(
                Icons.message,
                color: Colors.green,
                size: 100,
              ),

              // welcome back message
              const SizedBox(height: 40),
              const Text(
                "Welcome back, you've been missed!",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),

              // email textfield
              const SizedBox(height: 25), // just a black space(like margin)
              MyTextField(
                  controller: emailController,
                  placeholder: "Email",
                  obscureText: false),

              // password textfield
              const SizedBox(height: 10),
              MyTextField(
                  controller: passwordController,
                  placeholder: "Password",
                  obscureText: true),

              // sign in button
              const SizedBox(height: 15),
              MyButton(onTap: signIn, buttomname: "Sign In"),

              // not a member? register now
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not a member?"),
                  const SizedBox(width: 4),
                  GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
