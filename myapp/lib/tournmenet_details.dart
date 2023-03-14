import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/login.dart';
import 'package:myapp/util.dart';
import "tournements.dart";
import "dart:io";
import 'dart:convert';
import "my_globals.dart" as globals;

final dio = Dio();

final String token = globals.token;

void join(String tour_id) async {
  try {
    var params = {"user_id": globals.user_id, "tour_id": int.parse(tour_id)};
    print(params);
    final response = await dio.post(
      'https://simsvendapi-production.up.railway.app/tour/join',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        "Authorization": "Bearer $token",
      }),
      data: jsonEncode(params),
    );
  } on DioError catch (e) {
    print(e.message);
  }
}

class Tournement_Details extends StatefulWidget {
  final String id;

  const Tournement_Details({super.key, required this.id});

  @override
  State<Tournement_Details> createState() => _Tournement_DetailsState();
}

class _Tournement_DetailsState extends State<Tournement_Details> {
  List tournement = [];
  List players = [];

  bool showPlayers = false;

  bool joinable = true;

  Future<void> fetchTournament() async {
    try {
      final response = await Dio().get(
        'https://simsvendapi-production.up.railway.app/tour/' + widget.id,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      setState(() {
        tournement = response.data;

        players = tournement[0]["Players"];

        for (int i = 0; i < players.length; i++) {
          if (players[i]["userInfo"]["ID"] == globals.user_id) {
            joinable = false;
            print(joinable);
          }
        }
      });
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTournament();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text("Turneringsdetaljer"),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 1000,
                child: tournement.isEmpty && players.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: tournement.length,
                        itemBuilder: (context, index) {
                          final data = tournement[index];

                          data["date"] = dateConvert(data["date"]);

                          return Column(
                            children: [
                              Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${data['name']}',
                                    style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Pricepool: " +
                                        '${data['Tour']["price_pool"]}',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Minimum elo: " + '${data["elo"]}',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ImageIcon(AssetImage("assets/gender.png")),
                                    Text(
                                      " " + '${data["gender"]}',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Tilmeldte: " + '${data["how_many"]}',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Beskrivelse:",
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${data["Tour"]["dec"]}',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Dato: " + '${data["date"]}',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ImageIcon(
                                        AssetImage("assets/location.png")),
                                    Text(
                                      " " +
                                          '${data['Place']["name"]}' +
                                          " " +
                                          '${data['Place']["street_name"]}',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ],
                                ),
                                if (joinable) ...[
                                  ElevatedButton.icon(
                                    icon: Icon(Icons.sports_tennis),
                                    onPressed: () {
                                      setState(() {
                                        join("${data['ID']}");

                                        joinable = false;
                                      });
                                    },
                                    label: Text("Tilmeld turnering"),
                                  ),
                                ],
                                if (!showPlayers) ...[
                                  ElevatedButton.icon(
                                    icon: Icon(Icons.arrow_downward),
                                    onPressed: () {
                                      setState(() {
                                        showPlayers = true;
                                        Future.delayed(
                                            const Duration(milliseconds: 1000));
                                        fetchTournament();
                                      });
                                    },
                                    label: Text("Se tilmeldte"),
                                  ),
                                ] else ...[
                                  ElevatedButton.icon(
                                    icon: Icon(Icons.arrow_upward),
                                    onPressed: () {
                                      setState(() {
                                        showPlayers = false;
                                      });
                                    },
                                    label: Text("Skjul tilmeldte"),
                                  ),
                                ],
                                if (showPlayers) ...[
                                  for (int i = 0;
                                      i <= players.length - 1;
                                      i++) ...[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        (i + 1).toString() +
                                            " " +
                                            players[i]["userInfo"]
                                                ["first_name"] +
                                            " " +
                                            players[i]["userInfo"]["last_name"],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ]
                                ],
                              ]),
                            ],
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
