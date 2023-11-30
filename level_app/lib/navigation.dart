import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:level_app/Screens/Events/event_home.dart';
import 'package:level_app/Screens/Home/home.dart';
import 'package:level_app/Screens/Search/search_page.dart';

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
  final ThemeData theme;
  

  const Nav({Key? key, required this.theme}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedPage = 0;
  late String _currentUserId = ""; // Use a non-final variable

  final List<Widget> _pages = [
    const Home(),
    const EventHome(),
    const SearchPage(),
  ];

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  void _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedUserId = prefs.getString('userId') ?? '';
    if (storedUserId.isNotEmpty) {
      setState(() {
        _currentUserId = storedUserId;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level App',
      theme: ThemeData(
        primaryColor: widget.theme.primaryColor,
        colorScheme: widget.theme.colorScheme,
        useMaterial3: false,
      ),
      home: Scaffold(
        body: _pages[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.sports_hockey), label: 'Vs'),
            BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: 'Search'),
          ],
          backgroundColor: widget.theme.colorScheme.background,
          selectedItemColor: widget.theme.colorScheme.primary,
          unselectedItemColor: widget.theme.unselectedWidgetColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

