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

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

double _fontsize = 22;

class _ProfilState extends State<Profil> {
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

    print(globals.user_id);
    fetchProfil();
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
                    future: fetchProfil(),
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
                for (var i = 5; i >= 1; i--)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 180,
                      width: 300,
                      decoration: BoxDecoration(
                          color: (() {
                            if (i % 2 == 0)
                              return Color.fromARGB(255, 196, 196, 196);
                          })(),
                          border: Border.all(
                              width: 5, color: Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              "Mikkel Kronborg",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Lars Hansen",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "VS",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              "Mikkel Kronborg",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Lars Hansen",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "09-02-2022",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "2 - 1",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "+15",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
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
