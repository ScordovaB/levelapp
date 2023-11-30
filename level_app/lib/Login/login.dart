// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:level_app/Login/signup.dart';
import 'package:level_app/Login/main.dart';
import 'package:level_app/Screens/Profiles/UserProfile.dart';
import 'package:level_app/navigation.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  final String userId = 'TVR7vygHwtnekXtDL0P4';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 30.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Espacio en los lados
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 110.0,
                    width: MediaQuery.of(context).size.width / 1.25,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.25),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            16.0), // Redondea la esquina superior izquierda
                        topRight: Radius.circular(
                            16.0), // Redondea la esquina superior derecha
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(31.0),
                      child: Text(
                        'LEVEL UP',
                        style: TextStyle(
                          fontSize: 32.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),
                Container(
                  padding:
                      const EdgeInsets.all(30.0), // Espacio en todos los lados
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Enter your credentials",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.email),
                                labelText: "E-mail",
                                iconColor: Colors.black,
                                focusColor: Colors.green,
                                fillColor: Colors.green,
                                hoverColor: Colors.green,
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 9.0, horizontal: 15.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock_outline),
                                labelText: "Password",
                                iconColor: Colors.black,
                                focusColor: Colors.green,
                                fillColor: Colors.green,
                                hoverColor: Colors.green,
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 9.0, horizontal: 15.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 26.0),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Nav(
                                    theme: Theme.of(context),
                                    userId: widget.userId,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 19.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 10.0),
                                Text(
                                  'LOG IN',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: Text.rich(
                              TextSpan(
                                text: 'You do not have an account? ',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign Up!',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
