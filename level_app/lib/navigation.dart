import 'package:flutter/material.dart';
import 'package:level_app/Screens/Events/event_home.dart';
import 'package:level_app/Screens/Home/carousel_teams.dart';
import 'package:level_app/Screens/Home/home.dart';

class OBGreenPalette {
  static const MaterialColor kToDark = MaterialColor(
    0xff1B5E20, // 0% (Primary color)
    <int, Color>{
      50: Color(0xff1B5E20), // 10%
      100: Color(0xff1B5E20), // 20%
      200: Color(0xff1B5E20), // 30%
      300: Color(0xff1B5E20), // 40%
      400: Color(0xff1B5E20), // 50%
      500: Color(0xff1B5E20), // 60% (Primary color)
      600: Color(0xff1B5E20), // 70%
      700: Color(0xff1B5E20), // 80%
      800: Color(0xff1B5E20), // 90%
      900: Color(0xff1B5E20), // 100%
    },
  );
}


class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedPage = 0;
  final List<Widget> _pages = [
    const Home(),
    const EventHome(),
    const Home(),
    //Aqui se agregan la siguientes vistas
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level App',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 21, 87, 31),
        primarySwatch: OBGreenPalette.kToDark
      ),
      home: Scaffold(
      
        
        body: _pages[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },  
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.sports_hockey), label: 'Vs'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Followed'),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}