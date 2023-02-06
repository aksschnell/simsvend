import 'package:flutter/material.dart';

int _selectedIndex = 0;

Widget bottomBar() {
  const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Hjem',
      style: optionStyle,
    ),
    Text(
      'Index 1: Turneringer',
      style: optionStyle,
    ),
    Text(
      'Index 2: Spil',
      style: optionStyle,
    ),
    Text(
      'Index 3: Førertavle',
      style: optionStyle,
    ),
    Text(
      'Index 4: Profil',
      style: optionStyle,
    ),
  ];

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
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.black,
    ),
  );
}
