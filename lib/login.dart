import 'package:flutter/material.dart';
import 'package:flutter_application_1/Mahadev.dart';
import 'package:flutter_application_1/profile.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dilKnot'),
        titleTextStyle: TextStyle(
            color: const Color.fromARGB(255, 123, 34, 2),
            fontSize: 30,
            fontWeight: FontWeight.w600),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pin.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFFFC0CB), // Baby pink color
                        label: Text('Email'),
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 75, 1, 1),
                            fontSize: 25), // Maroon color
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 75, 1, 1),
                            fontSize: 20), // Maroon color
                        prefixIcon: Icon(Icons.mail,
                            color:
                                Color.fromARGB(255, 75, 1, 1)), // Maroon color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: BorderSide(
                            color:
                                Color.fromARGB(255, 75, 1, 1), // Maroon color
                            width: 5.0, // Thickness
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFFFC0CB), // Baby pink color
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 75, 1, 1),
                            fontSize: 25), // Maroon color
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 75, 1, 1),
                            fontSize: 20), // Maroon color
                        prefixIcon: Icon(Icons.lock,
                            color:
                                Color.fromARGB(255, 75, 1, 1)), // Maroon color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: BorderSide(
                            color:
                                Color.fromARGB(255, 75, 1, 1), // Maroon color
                            width: 5.0, // Thickness
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 150, top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
                                          detailsList: {},
                                        )),
                              );
                            }
                          },
                          child: Text("Log In",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 123, 34, 2),
                                  fontSize: 20)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
