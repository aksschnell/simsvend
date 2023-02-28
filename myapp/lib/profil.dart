import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import "dart:async";
import 'dart:convert';
import 'package:http/http.dart';
import 'package:myapp/play/casual.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

double _fontsize = 22;

/*

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
        id: json['UserStats.id'],
        elo: json['UserStats.elo'],
        Wins: json['UserStats.Wins'],
        losses: json["UserStats.losses"],
        points: json["UserStats.points"]);
  }
}

Future<List<User>> makePostRequest() async {
  final uri =
      Uri.parse('https://simsvendapi-production.up.railway.app/stats/1');

  final encoding = Encoding.getByName('utf-8');

  Response response = await get(
    uri,
  );

  var responseData = json.decode(response.body);

  List<User> users = [];
  for (var singleUser in responseData) {
    User user = User(
        id: singleUser["id"],
        elo: singleUser["elo"],
        points: singleUser["points"],
        Wins: singleUser["Wins"],
        losses: singleUser["losses"]);

    //Adding user to the list.
    users.add(user);
  }

  print(users);
  return users;
}

*/

class _ProfilState extends State<Profil> {
  List _leaderboardData = [];

  Future fetchProfil() async {
    try {
      final response = await Dio()
          .get('https://simsvendapi-production.up.railway.app/leaderboard/1');
      setState(() {
        _leaderboardData = response.data;

        print(_leaderboardData[0]['ID']);
      });
    } catch (e) {
      // handle error

      print(e);
    }
  }

  void initState() {
    super.initState();
    fetchProfil();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                FutureBuilder(
                  future: fetchProfil(),
                  builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Column(children: [
                          Text("Elo: Loading...",
                              style: TextStyle(fontSize: _fontsize)),
                          Text("Points: Loading...",
                              style: TextStyle(fontSize: _fontsize)),
                          Text("Wins: Loading...",
                              style: TextStyle(fontSize: _fontsize)),
                          Text("Losses: Loading...",
                              style: TextStyle(fontSize: _fontsize)),
                        ]),
                      );
                    } else {
                      return Container(
                          child: Column(
                        children: [
                          Text(snapshot.data[0].toString()),
                          Text("Elo: " + snapshot.data[0].elo.toString(),
                              style: TextStyle(fontSize: _fontsize)),
                          Text("Points: " + snapshot.data[0].points.toString(),
                              style: TextStyle(fontSize: _fontsize)),
                          Text("Wins: " + snapshot.data[0].Wins.toString(),
                              style: TextStyle(fontSize: _fontsize)),
                          Text("Losses: " + snapshot.data[0].losses.toString(),
                              style: TextStyle(fontSize: _fontsize)),
                        ],
                      ));
                    }
                  },
                ),
                Text(_leaderboardData[0]["ID"].toString()),
                for (var i = 5; i >= 1; i--)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 180,
                      width: 300,
                      decoration: BoxDecoration(
                          color: (() {
                            if (i % 2 == 0)
                              return Color.fromARGB(255, 196, 196, 196);
                          })(),
                          border: Border.all(
                              width: 5, color: Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              "Mikkel Kronborg",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Lars Hansen",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "VS",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              "Mikkel Kronborg",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Lars Hansen",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "09-02-2022",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "2 - 1",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "+15",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
