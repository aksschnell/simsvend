import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Tournements extends StatefulWidget {
  const Tournements({super.key});

  @override
  State<Tournements> createState() => _TournementsState();
}

class _TournementsState extends State<Tournements> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Turneringer'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                child: Text(""),
              ),
            ),
            for (var i = 5; i >= 1; i--)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
                  height: 100,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 230, 230, 230),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      //<-- SEE HERE
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
                            ImageIcon(AssetImage("assets/location.png")),
                            Text("PadelBoxen"),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Row(
                          children: [
                            ImageIcon(AssetImage("assets/gender.png")),
                            Text("Mix"),
                          ],
                        ),
                      ),
                      Positioned.fill(
                          child: Align(
                        alignment: Alignment.center,
                        child: Text("14-02-2023"),
                      )),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        child: Row(
                          children: [
                            ImageIcon(AssetImage("assets/points.png")),
                            Text("100 Points"),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Row(
                          children: [
                            ImageIcon(AssetImage("assets/group.png")),
                            Text("10/100"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    ));
  }
}
