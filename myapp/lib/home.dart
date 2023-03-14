import 'package:flutter/material.dart';
import "package:flutter/services.dart";

import "login.dart";
import "profil.dart";

import "home_page.dart";
import "tournements.dart";
import "play/play.dart";
import "leaderboard2.dart";
import 'package:vibration/vibration.dart';

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
    Tournements(),
    Play(),
    LeaderboardWidget(),
    Profil(),
  ];

  void _onItemTapped(int index) {
    HapticFeedback.heavyImpact();

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
