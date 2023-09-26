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
        primaryColor: const Color.fromARGB(255, 25, 99, 36),
        primarySwatch: Colors.grey
      ),
      home:const  Nav(),
      debugShowCheckedModeBanner: false,
    );
  }
}
