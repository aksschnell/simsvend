import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/home.dart';
import 'package:myapp/play/date.dart';
import "date.dart";

class Confirm extends StatefulWidget {
  final String gamemode;
  final String single_or_double;
  final String court;
  final String teammate;
  final String op1;
  final String op2;
  final String date;

  const Confirm(
      {super.key,
      required this.gamemode,
      required this.single_or_double,
      required this.court,
      required this.teammate,
      required this.op1,
      required this.op2,
      required this.date});

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
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
                      builder: (context) => Date(
                            teammate: widget.teammate,
                            court: widget.court,
                            single_or_double: widget.single_or_double,
                            gamemode: widget.gamemode,
                            op1: widget.op1,
                            op2: widget.op2,
                          )));
            },
          ),
          title: Text("Vælg dato"),
        ),
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Gamemode: " + widget.gamemode),
                Text("Holdkammerat: " + widget.teammate),
                Text("Modstander 1: " + widget.op1),
                Text("Modstander 2: " + widget.op2),
                Text("Bane: " + widget.court),
                Text("Dato: " + widget.date),
                ElevatedButton(
                  child: Text(
                    'OK',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
