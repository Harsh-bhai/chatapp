import "package:chatapp/components/my_button.dart";
import "package:chatapp/components/my_text_field.dart";
import "package:chatapp/services/auth/auth_service.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  void signUp() async {
    if (passwordController.text != confirmPassController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password does not match"),
        ),
      );
      return;
    }

    // get auth service
    final authservice = Provider.of<AuthService>(context, listen: false);
    try {
      await authservice.signUpWithEmailAndPassword(
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
        child: SingleChildScrollView(
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
          
                // create an account
                const SizedBox(height: 40),
                const Text(
                  "Let's create an account",
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
          
                // confirm password textfield
                const SizedBox(height: 10),
                MyTextField(
                    controller: confirmPassController,
                    placeholder: "Confirm Password",
                    obscureText: true),
          
                // sign in button
                const SizedBox(height: 15),
                MyButton(onTap: signUp, buttomname: "Register"),
          
                // not a member? register now
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already a member?"),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
