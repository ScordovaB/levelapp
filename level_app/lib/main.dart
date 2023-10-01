import 'package:flutter/material.dart';
import 'package:level_app/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level App',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 15, 63, 23),
        primarySwatch: Colors.grey
      ),
      home:const  Nav(),
      debugShowCheckedModeBanner: false,
    );
  }
}
