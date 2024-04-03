import 'package:f_rabe3na/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sign_up_screen.dart'; // Ensure this file exists in your project

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF57c1eb), // Lighter blue
              Color(0xFF004e92), // Darker blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo_2_trans.png', height: 120), // Update asset path as needed
                  SizedBox(height: 24),
                  Text(
                    'Sign In',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
  try {
    // Attempt to sign in the user with the provided credentials
    final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
    );

    // Check if sign in was successful and user is not null
    if (userCredential.user != null) {
      print("Sign in successful!");

      // TODO: Navigate to the HomeScreen or another screen as needed
      // Example: Uncomment and adjust navigation below once HomeScreen is implemented
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    }
  } on FirebaseAuthException catch (e) {
    // Handle known errors
    String errorMessage = "An error occurred. Please try again.";
    if (e.code == 'user-not-found') {
      errorMessage = "No user found for that email.";
    } else if (e.code == 'wrong-password') {
      errorMessage = "Wrong password provided for that user.";
    }

    // Display an error dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Sign In Failed'),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
          ),
        ],
      ),
    );
  }
},
                    child: Text('Sign In', style: TextStyle(color: Color(0xFF004e92))),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    },
                    child: Text('Not a user? Sign up', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
