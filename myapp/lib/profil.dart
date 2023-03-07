import 'dart:ffi';
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
import "my_globals.dart" as globals;
import "login.dart";
import "util.dart";

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

double _fontsize = 22;

Future<List<dynamic>> fetchHistory() async {
  List result = [];

  try {
    final response = await Dio().get(
        'https://simsvendapi-production.up.railway.app/match/' +
            globals.user_id.toString());

    result = response.data;
  } catch (e) {
    print(e);
  }

  print(result);
  return result;
}

class _ProfilState extends State<Profil> {
  late Future<List<dynamic>> match_future;
  late Future<List<dynamic>> profil_future;

  Future<List<dynamic>> fetchProfil() async {
    List result = [];

    try {
      final response = await Dio().get(
          'https://simsvendapi-production.up.railway.app/user/token/' +
              globals.user_id.toString());

      setState(() {
        result = response.data;
      });
    } catch (e) {
      print(e);
    }

    return result;
  }

  void LogOut() {
    setState(() {
      globals.user_id = 0;
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  void initState() {
    super.initState();

    match_future = fetchHistory();
    profil_future = fetchProfil();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
          leading: IconButton(
            icon: Icon(Icons.logout_sharp, color: Colors.black),
            onPressed: () {
              LogOut();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 150,
                  child: FutureBuilder<List<dynamic>>(
                    future: profil_future,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<dynamic>> snapshot) {
                      if (snapshot.hasData) {
                        List<dynamic> data = snapshot.data!;
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final profile = data[index];

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(children: [
                                  Text(
                                    'User ID: ${profile['ID']}',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Text(
                                    'Navn: ${profile['userInfo']['first_name']} ' +
                                        "${profile['userInfo']['last_name']}",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Text(
                                    'Elo: ${profile['UserStats']['elo']}',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Text(
                                    'Points: ${profile['UserStats']['points']}',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ]),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error loading data'),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  child: FutureBuilder<List<dynamic>>(
                    future: match_future,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<dynamic>> snapshot) {
                      if (snapshot.hasData) {
                        List<dynamic> data = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final match = data[index];

                            match['play_time'] =
                                dateConvert(match['play_time']);

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: (() {
                                      return Color.fromARGB(255, 196, 196, 196);
                                    })(),
                                    border: Border.all(
                                        width: 5,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${match['User1']["first_name"] + " " + match['User1']["last_name"]}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${match['User2']["first_name"] + " " + match['User2']["last_name"]}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "VS",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      Text(
                                        "${match['User3']["first_name"] + " " + match['User3']["last_name"]}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${match['User4']["first_name"] + " " + match['User4']["last_name"]}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${match['play_time']}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error loading data'),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
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
