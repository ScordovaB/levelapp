import 'package:flutter/material.dart';
//import 'package:level_app/navigation.dart';
import 'package:level_app/Login/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:level_app/theme/bloc/theme_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ThemeBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Level App',
          theme: state.themeData,
          home: const  LoginHome(title: "LoginHome"),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
