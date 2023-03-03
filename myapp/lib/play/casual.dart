import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "play.dart";
import 'package:intl/intl.dart';

const List<String> list = <String>['PadelBoxen', 'PadelPadel', 'Padel Odense'];
const List<String> players = <String>[
  'Mikkel Kronborg',
  'Jakob Johansen',
  'Oliver Mathiesen'
];

class Casual extends StatefulWidget {
  final String value;
  const Casual({super.key, required this.value});

  @override
  State<Casual> createState() => _CasualState();
}

class _CasualState extends State<Casual> {
  String dropdownValue = list.first;
  String dropdownValue2 = players.first;
  TextEditingController dateInput = TextEditingController();

  String gamemode = "single";
  String match_players = "random";

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Casual"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.value,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
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
              Container(
                child: Column(
                  children: [
                    RadioListTile(
                      title: Text("Single"),
                      value: "single",
                      groupValue: gamemode,
                      onChanged: (value) {
                        setState(() {
                          gamemode = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Double"),
                      value: "double",
                      groupValue: gamemode,
                      onChanged: (value) {
                        setState(() {
                          gamemode = value.toString();
                        });
                      },
                    ),
                  ],
                ),
              ),
              if (gamemode == "single") ...[
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    "Vælg modstander",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
              ],
              if (gamemode == "double") ...[
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    "Vælg holdkammerat",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
              ],
              if (match_players == "friends") ...[
                DropdownButton<String>(
                  value: dropdownValue2,
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
                      dropdownValue2 = value!;
                    });
                  },
                  items: players.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
              if (match_players == "friends" && gamemode == "double") ...[
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    "Vælg modstander",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
                DropdownButton<String>(
                  value: dropdownValue2,
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
                      dropdownValue2 = value!;
                    });
                  },
                  items: players.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: dropdownValue2,
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
                      dropdownValue2 = value!;
                    });
                  },
                  items: players.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  "Vælg tidspunkt",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
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
            ]),
          ),
        ),
      ),
    );
  }
}
