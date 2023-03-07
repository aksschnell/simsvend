import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "package:myapp/util.dart";

class History_details extends StatefulWidget {
  const History_details({super.key});

  @override
  State<History_details> createState() => _History_detailsState();
}

List match = [];

class _History_detailsState extends State<History_details> {
  Future<void> fetchTournament() async {
    try {
      final response = await Dio().get(
          'https://simsvendapi-production.up.railway.app/tour/' + widget.id);
      setState(() {
        match = response.data;
      });
    } catch (e) {}
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
                child: match.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: match.length,
                        itemBuilder: (context, index) {
                          final data = match[index];

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
                                        '${data['Tour']["PricePool"]}',
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
