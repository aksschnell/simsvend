import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/play/confirm.dart';
import 'package:myapp/play/opponent.dart';
import 'package:intl/intl.dart';

class Date extends StatefulWidget {
  final String gamemode;
  final String single_or_double;
  final String court;
  final String teammate;
  final String op1;
  final String op2;

  const Date(
      {super.key,
      required this.gamemode,
      required this.single_or_double,
      required this.court,
      required this.teammate,
      required this.op1,
      required this.op2});

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  @override
  TextEditingController dateInput = TextEditingController();
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
                    builder: (context) => opponentselecter(
                        teammate: widget.teammate,
                        court: widget.court,
                        single_or_double: widget.single_or_double,
                        gamemode: widget.gamemode)));
          },
        ),
        title: Text("Vælg dato"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Vælg dato"),
            ),
            Container(
                padding: EdgeInsets.all(15),
                height: MediaQuery.of(context).size.width / 3,
                child: Center(
                    child: TextField(
                  controller: dateInput,
                  //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateInput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                ))),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Confirm(
                                  date: dateInput.text,
                                  teammate: widget.teammate,
                                  single_or_double: widget.single_or_double,
                                  gamemode: widget.gamemode,
                                  court: widget.court,
                                  op1: widget.op1,
                                  op2: widget.op2,
                                )));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
