import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "package:myapp/util.dart";

class History_details extends StatefulWidget {
  final String id;
  const History_details({super.key, required this.id});

  @override
  State<History_details> createState() => _History_detailsState();
}

List match = [];

class _History_detailsState extends State<History_details> {
  Future<void> fetchMatch() async {
    try {
      final response = await Dio().get(
          'https://simsvendapi-production.up.railway.app/match/game/' +
              widget.id);
      setState(() {
        print(response.data);
        match = response.data;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMatch();
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
          title: Text("Kampdetaljer"),
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

                          data["play_time"] = dateConvert(data["play_time"]);

                          return Column(
                            children: [
                              Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    '${data['play_time']}',
                                    style: TextStyle(
                                      fontSize: 36,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Bane: ${data['Court']['name']}: ${data['Place']['name']}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${data['User1']['first_name']} ${data['User2']['last_name']} \n${data['User2']['first_name']} ${data['User2']['last_name']}  ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                Text("VS"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${data['User3']['first_name']} ${data['User2']['last_name']} \n${data['User4']['first_name']} ${data['User2']['last_name']}  ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Resultat",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 36,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${data['Result']['AOne']} - ${data['Result']['BOne']} \n${data['Result']['ATwo']} - ${data['Result']['BTwo']}\n${data['Result']['AThree']} - ${data['Result']['BThree']}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
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
