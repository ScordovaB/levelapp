import 'package:flutter/material.dart';
import 'package:level_app/Screens/home.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedPage = 0;
  final List<Widget> _pages = [
    const Home(),
    const Home(),
    const Home(),
    //Aqui se agregan la siguientes vistas
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level App',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 25, 99, 36),
        primarySwatch: Colors.green
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