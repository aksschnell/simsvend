import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:dio/dio.dart';
import 'package:myapp/tournmenet_details.dart';

class Tournements extends StatefulWidget {
  const Tournements({super.key});

  @override
  State<Tournements> createState() => _TournementsState();
}

class _TournementsState extends State<Tournements> {
  Future<List<dynamic>> fetchTours() async {
    List result = [];
    try {
      final response =
          await Dio().get('https://simsvendapi-production.up.railway.app/tour');

      setState(() {
        result = response.data;

        for (int i = 1; i <= result.length; i++) {
          String date = response.data[0]["date"];
          final splitted = date.split("T");
          result[i - 1]["date"] = splitted[0];
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

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Container(
                                    height: 100,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 230, 230, 230),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        width: 5,
                                      ),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        print('${tours['ID']}');
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Tournement_Details(
                                                      id: '${tours['ID']}',
                                                    )));
                                      },
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
                                              '${tours['date']}',
                                            ),
                                          )),
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
            ],
          ),
        ),
      ),
    ));
  }
}
