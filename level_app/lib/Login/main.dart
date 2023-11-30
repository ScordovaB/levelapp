// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:level_app/Login/login.dart';
import 'package:level_app/Login/signup.dart';
import 'package:level_app/firebase_options.dart';
import 'package:level_app/navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginHome(title: 'Login Home'),
    );
  }
}

class LoginHome extends StatefulWidget {
  const LoginHome({super.key, required this.title});
  final String title;
  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future userDetails(String name, String email, String password) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'email': email,
      'password': password,
      'teams': {},
      'players': {},
      'userId': ''
    });
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);

        String email =
            googleUser.email; // El correo electrónico siempre está disponible
        var usersCollection = FirebaseFirestore.instance.collection('users');
        var docSnapshot = await usersCollection.doc(email).get();

        if (!docSnapshot.exists) {
          String name = googleUser.displayName ?? 'Common User';

          await usersCollection.doc(email).set({
            'name': name,
            'email': email,
            'password': 'googleAUTH',
            'players': {},
            'teams': {}
          });
        }

        // Navegar a la pantalla principal después de la autenticación exitosa
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Nav(
              theme: Theme.of(context),
            ),
          ),
        );
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/login/login_home.jpg',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  'assets/images/login/white_gradient.png',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Now you can LEVEL UP your game!',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.0),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 21.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.email,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Sign up with e-mail',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          'Or use social media',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(height: 15.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              _handleGoogleSignIn();
                              /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Nav(
                                    theme: Theme.of(context),
                                    userId: widget.userId,
                                  ),
                                ),
                              );*/
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.g_translate,
                                    size: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Nav(
                                    theme: Theme.of(context),
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.facebook_outlined,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Sign in with Facebook',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 25.0),
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
                                  text: 'Log in!',
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
                )),
          ],
        ),
      ),
    );
  }
}
