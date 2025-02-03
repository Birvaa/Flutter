import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/signUp.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pin.jpeg'), // Background image
            fit: BoxFit.cover, // This will cover the entire container
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 130), // Space from the top
            Center(
              child: Image.asset(
                'assets/Logo.png', // Logo image
                width: 150, // Set the width of the logo
                height: 150, // Set the height of the logo
                fit: BoxFit.contain, // Adjust the logo size
              ),
            ),
            SizedBox(height: 20),
            Text(
              "New to dilKnot??",
              style: TextStyle(
                color: const Color.fromARGB(255, 70, 2, 2),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 70, 2, 2),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(height: 20),
            Text(
              "Already have an Account??",
              style: TextStyle(
                color: const Color.fromARGB(255, 70, 2, 2),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 70, 2, 2),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
