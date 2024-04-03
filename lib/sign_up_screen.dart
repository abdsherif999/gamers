import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sign_in_screen.dart'; // Ensure this file exists in your project

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Color(0xFF004e92),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView( // Added to ensure the form is scrollable
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (passwordController.text == confirmPasswordController.text) {
                    try {
                      final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );

                      if (userCredential.user != null) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Sign Up Successful'),
                            content: Text('Your account has been created. Please sign in.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop(); // Dismiss the dialog
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SignInScreen()));
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      // If Firebase returns an error
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Sign Up Failed'),
                          content: Text(e.message ?? 'Unknown error occurred.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    // If passwords do not match
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('Passwords do not match.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF004e92),
                  foregroundColor: Colors.white, // Corrected from foregroundColor to onPrimary for text color
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
