import 'package:flutter/material.dart';
import "package:myapp/leaderboard.dart";
import "login.dart";
import "profil.dart";
import "leaderboard.dart";
import "home_page.dart";

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[



    HomePage(),
    
    Text(
      'Index 1: Turneringer',
      style: optionStyle,
    ),
    Text(
      'Index 2: Spil',
      style: optionStyle,
    ),
    Scaffold(
      body: Leaderboard()
    ),
    Scaffold(
    body: Profil(),
  
    ),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
        /*
      if (_selectedIndex == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    */

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hjem'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Hjem',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/tournament.png"),
            ),
            label: 'Turneringer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_tennis_outlined),
            label: 'Spil',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/leaderboard.png"),
            ),
            label: 'Førertavle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 236, 152, 48),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
