import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/history_details.dart';
import 'package:myapp/play/opponent.dart';
import "court.dart";
import "date.dart";
import "package:myapp/my_globals.dart" as globals;
import "dart:io";

List<String> list = ["."];

String teammate = "";

class Teammateselecter extends StatefulWidget {
  final String gamemode;
  final String single_or_double;
  final String court;

  const Teammateselecter(
      {super.key,
      required this.gamemode,
      required this.single_or_double,
      required this.court});

  @override
  State<Teammateselecter> createState() => _TeammateselecterState();
}

class _TeammateselecterState extends State<Teammateselecter> {
  String match_players = list.first;
  String dropdownValue = list.first;
  void initState() {
    match_players = "randoms";

    list.clear();

    for (int i = 0; i < globals.friends.length; i++) {
      print(globals.friends[i]);

      list.add(globals.friends[i]);
    }

    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Court(
                          single_or_double: widget.single_or_double,
                          gamemode: widget.gamemode)));
            },
          ),
          title: Text("Vælg holdkammerat"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Vælg holdkammerat",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    RadioListTile(
                      title: Text("Tilfældig"),
                      value: "randoms",
                      groupValue: match_players,
                      onChanged: (value) {
                        setState(() {
                          match_players = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Egen ven"),
                      value: "friends",
                      groupValue: match_players,
                      onChanged: (value) {
                        setState(() {
                          match_players = value.toString();
                        });
                      },
                    ),
                  ],
                ),
              ),
              if (match_players == "friends") ...[
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new SizedBox(
                  width: 76.0,
                  height: 76.0,
                  child: ElevatedButton(
                    child: Text(
                      'OK',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (widget.gamemode == "Casual" &&
                          match_players == "randoms") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => opponentselecter(
                                      teammate: "Random",
                                      single_or_double: widget.single_or_double,
                                      gamemode: widget.gamemode,
                                      court: widget.court,
                                    )));
                      } else if (widget.gamemode == "Casual" &&
                          match_players == "friends") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => opponentselecter(
                                      teammate: dropdownValue,
                                      single_or_double: widget.single_or_double,
                                      gamemode: widget.gamemode,
                                      court: widget.court,
                                    )));
                      } else if (widget.gamemode == "Competitive" &&
                          match_players == "randoms") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Date(
                                      teammate: "Random",
                                      single_or_double: widget.single_or_double,
                                      gamemode: widget.gamemode,
                                      court: widget.court,
                                      op1: "None",
                                      op2: "None",
                                    )));
                      } else if (widget.gamemode == "Competitive" &&
                          match_players == "friends") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Date(
                                      teammate: dropdownValue,
                                      single_or_double: widget.single_or_double,
                                      gamemode: widget.gamemode,
                                      court: widget.court,
                                      op1: "None",
                                      op2: "None",
                                    )));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
