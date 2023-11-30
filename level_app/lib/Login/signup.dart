// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:level_app/Login/login.dart';
import 'package:level_app/Login/main.dart';
import 'package:level_app/Login/termsAndConditions.dart';
import 'package:level_app/navigation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;
  bool _passwordIsConfirmed = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible1 = false;
    _passwordVisible2 = false;
    _passwordIsConfirmed = false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  Future<void> _signup(Permission permission, BuildContext context) async {
    if (passwordIsConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      checkPermission(permission, context);

      // user details
      userDetails(_nameController.text.trim(), _emailController.text.trim(),
          _passwordController.text.trim());
    }
  }

  Future userDetails(String name, String email, String password) async {
    DocumentReference docRef =
        await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'email': email,
      'password': password,
      'teams': [],
      'players': [],
      'userId': '',
      'profile': "",
      'background': 1,
    });

    String userId = docRef.id;
    await docRef.update({
      'userId': userId,
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);

    print('Local Storage: UserId: ${prefs.getString('userId')}');
  }

  bool passwordIsConfirmed() {
    if (_passwordController.text.trim() == _passwordController2.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> checkPermission(
      Permission permission, BuildContext context) async {
    final status = await permission.request();
    if (status.isGranted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Permission granted")));

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Nav(
            theme: Theme.of(context),
          ),
        ),
      );
    }
  }

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
          margin: const EdgeInsets.only(top: 20.0),
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
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
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
                  padding: const EdgeInsets.all(30.0),
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
                        "Create Account",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Let's get started by filling the form below.",
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
                              controller: _nameController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                labelText: "Name / Nickname",
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
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _emailController,
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
                              controller: _passwordController,
                              obscureText: !_passwordVisible1,
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock_outline),
                                labelText: "Password",
                                iconColor: Colors.black,
                                focusColor: Colors.green,
                                fillColor: Colors.green,
                                hoverColor: Colors.green,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible1
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible1 = !_passwordVisible1;
                                    });
                                  },
                                ),
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
                              controller: _passwordController2,
                              obscureText: !_passwordVisible2,
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock_outline),
                                labelText: "Confirm password",
                                iconColor: Colors.black,
                                focusColor: Colors.green,
                                fillColor: Colors.green,
                                hoverColor: Colors.green,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible2
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible2 = !_passwordVisible2;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 9.0, horizontal: 15.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 22.0),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.0,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'When creating your account, you accept the ',
                            ),
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TermsAndConditions(),
                                    ),
                                  );
                                },
                            ),
                            TextSpan(
                              text: '.',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              _signup(Permission.notification, context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 17.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                ),
                                SizedBox(width: 11.0),
                                Text(
                                  'Get started',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          if ((_passwordController.text.trim() !=
                                  _passwordController2.text.trim()) &
                              (_passwordController.text.trim() != '') &
                              (_passwordController2.text.trim() != ''))
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Password is not the same',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                            child: Text.rich(
                              TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Log In!',
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
