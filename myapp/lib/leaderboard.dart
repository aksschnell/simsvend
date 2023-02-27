import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "home.dart";
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class User {
  final int id;
  final int elo;
  final int Wins;
  final int losses;
  final int points;

  const User(
      {required this.id,
      required this.elo,
      required this.Wins,
      required this.losses,
      required this.points});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        elo: json['elo'],
        Wins: json['Wins'],
        losses: json["losses"],
        points: json["points"]);
  }
}

class _LeaderboardState extends State<Leaderboard> {
  String rowName = "Points";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Førertavle'),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(40, 40)),
                    child: const Text(
                      "Elo",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        this.rowName = "Elo";
                      });
                    },
                  ),
                ),
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(40, 40)),
                child: const Text('Points', style: TextStyle(fontSize: 20)),
                onPressed: () {
                  setState(() {
                    this.rowName = "Points";
                  });
                },
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Table(
              defaultColumnWidth: FixedColumnWidth(170),
              border: TableBorder.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 0,
              ),
              children: [
                TableRow(children: [
                  Column(
                    children: [
                      Text(
                        "Navn",
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "${rowName}",
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                ]),
                for (var i = 50; i >= 1; i--)
                  TableRow(children: [
                    Column(
                      children: [
                        Text(
                          "Jens Jensen",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "1500",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ]),
              ],
            ),
          )
        ],
      ))),
    ));
  }
}
