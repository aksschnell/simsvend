import 'dart:io';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:myapp/tournmenet_details.dart';
import "util.dart";
import "my_globals.dart" as globals;

class Tournements extends StatefulWidget {
  const Tournements({super.key});

  @override
  State<Tournements> createState() => _TournementsState();
}

final String token = globals.token;

class _TournementsState extends State<Tournements> {
  Future<List<dynamic>> fetchTours() async {
    List result = [];
    try {
      final response = await Dio().get(
        'https://simsvendapi-production.up.railway.app/tour',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      setState(() {
        result = response.data;

        for (int i = 1; i <= result.length; i++) {
          result[i - 1]["date"] = dateConvert(response.data[0]["date"]);
        }
      });
    } catch (e) {
      print(e);
    }

    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTours();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Turneringer'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 16),
              ),
              SizedBox(
                child: FutureBuilder<List<dynamic>>(
                  future: fetchTours(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<dynamic>> snapshot) {
                    if (snapshot.hasData) {
                      List<dynamic> data = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final tours = data[index];

                          return GestureDetector(
                            onTap: () {
                              print('${tours['ID']}');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tournement_Details(
                                            id: '${tours['ID']}',
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Container(
                                      height: 100,
                                      width: 350,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 230, 230, 230),
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          width: 5,
                                        ),
                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            top: 5,
                                            left: 5,
                                            child: Row(
                                              children: [
                                                ImageIcon(AssetImage(
                                                    "assets/location.png")),
                                                Text(
                                                  '${tours['Place']["name"]}',
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            top: 5,
                                            right: 5,
                                            child: Row(
                                              children: [
                                                ImageIcon(AssetImage(
                                                    "assets/gender.png")),
                                                Text(
                                                  '${tours['gender']}',
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned.fill(
                                              child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              '${tours['name']}',
                                            ),
                                          )),
                                          Positioned(
                                            right: 132,
                                            bottom: 0,
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${tours['date']}',
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            left: 5,
                                            child: Row(
                                              children: [
                                                ImageIcon(AssetImage(
                                                    "assets/points.png")),
                                                Text(
                                                  "Min. elo " +
                                                      '${tours['elo']}',
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Row(
                                              children: [
                                                ImageIcon(AssetImage(
                                                    "assets/group.png")),
                                                Text(
                                                  '${tours['how_many']}',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
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
    ));
  }
}
