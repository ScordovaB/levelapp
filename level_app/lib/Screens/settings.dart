import 'package:flutter/material.dart';
import 'package:level_app/theme/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/app_themes.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final _greenLightTheme = AppTheme.GreenLight;
  final _greenDarkTheme = AppTheme.GreenDark;
  

  bool darkSelected = false;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white, 
              size: 30,
            ),
            onPressed: () async {
              Navigator.of(context).pop(); 
            },
          ),
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.white),
            //style: Theme.of(context).textTheme.titleLarge, 
          ),
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Text("Change Theme:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: (){
                        BlocProvider.of<ThemeBloc>(context)
                          .add(ThemeChangedEvent(theme: _greenLightTheme));
                      },
                       child: const Text("Light Theme"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: (){
                        darkSelected = true;
                        BlocProvider.of<ThemeBloc>(context)
                          .add(ThemeChangedEvent(theme: _greenDarkTheme));
                      },
                       child: const Text("Dark Theme"),
                    ),
                  )
                ],
            
              ),
            ),
          ))
        );
  }
}