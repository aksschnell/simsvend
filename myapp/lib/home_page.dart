import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:ui';
import "dart:io";
import "my_globals.dart" as globals;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String token = globals.token;
  List top3elo = [];
  List top3eloresult = [];

  List top3points = [];
  List top3pointsresult = [];

  Future<void> fetchTop3Elo() async {
    try {
      final response = await Dio().get(
        'https://simsvendapi-production.up.railway.app/user/leaderboard',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      setState(() {
        top3elo = response.data;

        top3elo.sort(
            (a, b) => b["UserStats"]["elo"].compareTo(a["UserStats"]["elo"]));

        for (int i = 0; i <= 2; i++) {
          top3eloresult.add(top3elo[i]);
        }
      });
    } catch (e) {}
  }

  Future<void> fetchTop3Points() async {
    try {
      final response = await Dio().get(
        'https://simsvendapi-production.up.railway.app/user/leaderboard',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      setState(() {
        top3points = response.data;

        top3points.sort((a, b) =>
            b["UserStats"]["points"].compareTo(a["UserStats"]["points"]));

        for (int i = 0; i <= 2; i++) {
          top3pointsresult.add(top3points[i]);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTop3Elo();
    fetchTop3Points();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Hjem'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 150,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 236, 236, 236),
                            border: Border.all(
                                width: 5, color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                  "Månedens præmiern sponsoret af padelboxen",
                                  textAlign: TextAlign.center),
                            ),
                            Text("1. Plads 1000kr"),
                            Text("2. Plads 750"),
                            Text("3. Plads 500kr"),
                          ]),
                        )),
                  ),
                  SizedBox(
                    height: 170,
                    width: 350,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              //<-- SEE HERE
                              width: 5,
                            ),
                          ),
                          child: Image.asset('assets/padel2.jpg',
                              fit: BoxFit.cover),
                        ),
                        ClipRRect(
                          // Clip it cleanly.

                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                    child: Text("Dine kommende kampe",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white))),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("15. februar kl 16.",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17)),
                                      Text("PadelBoxen. Bane 2",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17)),
                                    ],
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("15. februar kl 16.",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17)),
                                      Text("PadelBoxen. Bane 2",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17)),
                                    ],
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Expanded(
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 236, 236, 236),
                            border: Border.all(
                              //<-- SEE HERE
                              width: 3,
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Center(
                                  child: const Text(
                                "Top 3 elo",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              SizedBox(
                                height: 100,
                                child: top3eloresult.isEmpty
                                    ? Center(child: CircularProgressIndicator())
                                    : ListView.builder(
                                        itemCount: top3eloresult.length,
                                        itemBuilder: (context, index) {
                                          final data = top3eloresult[index];

                                          return Column(
                                            children: [
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      (index + 1).toString() +
                                                          " " +
                                                          '${data['userInfo']["first_name"]} ${data['userInfo']["last_name"]}' +
                                                          " elo " +
                                                          '${data["UserStats"]["elo"]}',
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 236, 236, 236),
                            border: Border.all(
                              //<-- SEE HERE
                              width: 3,
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Center(
                                  child: const Text(
                                "Top 3 points",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              SizedBox(
                                height: 130,
                                child: top3pointsresult.isEmpty
                                    ? Center(child: CircularProgressIndicator())
                                    : ListView.builder(
                                        itemCount: top3eloresult.length,
                                        itemBuilder: (context, index) {
                                          final data = top3eloresult[index];

                                          return Column(
                                            children: [
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      (index + 1).toString() +
                                                          " " +
                                                          '${data['userInfo']["first_name"]} ${data['userInfo']["last_name"]}' +
                                                          " points " +
                                                          '${data["UserStats"]["points"]}',
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 236, 236, 236),
                            border: Border.all(
                              //<-- SEE HERE
                              width: 3,
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Center(
                                  child: const Text(
                                "Kamp historik",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 8),
                                child: Container(
                                  child: Text(
                                    "1. februar 2-1",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text(
                                    "20. januar 1-2",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text(
                                    " 19. januar 3-0",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 236, 236, 236),
                            border: Border.all(
                              //<-- SEE HERE
                              width: 3,
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Center(
                                  child: const Text(
                                "Nærmeste baner",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 8),
                                child: Container(
                                  child: Text("PadelBoxen 25km."),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Text("PadelPadel 40km."),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            )));
  }
}
