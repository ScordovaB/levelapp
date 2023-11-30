import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:level_app/navigation.dart';
import 'package:level_app/Login/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:level_app/theme/bloc/theme_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          home: const LoginHome(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
