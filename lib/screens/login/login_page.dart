import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_searching_app/database/auth.dart';
import 'package:flutter/material.dart';
import 'package:job_searching_app/screens/login/widgets/login_button.dart';
import 'package:job_searching_app/screens/login/widgets/my_textfield.dart';
import 'package:job_searching_app/screens/login/widgets/register_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? errorMessage = '';

  // Check Whether login
  bool isLogin = true;

  // Text Controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Sign in Function
  Future<void> signInWithEmailAndPassword() async {
    try{
      await Auth().signInWithEmailAndPassword(
        email: emailController.text,
        password: emailController.text
      );
    }on FirebaseAuthException catch(e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  // Register Function
  Future<void> createUserWithEmailAndPassword() async {
    try{
      await Auth().createUserWithEmailAndPassword(
          email: emailController.text,
          password: emailController.text
      );
    }on FirebaseAuthException catch(e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),

                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                LoginButton(
                  onTap: () {

                    try{
                      signInWithEmailAndPassword();
                    }
                    catch (e) {
                      print(e);
                    }
                  },
                ),

                const SizedBox(height: 10),

                RegisterButton(
                  onTap: () {
                    createUserWithEmailAndPassword();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
