import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import "my_globals.dart" as globals;

class LeaderboardWidget extends StatefulWidget {
  const LeaderboardWidget({super.key});

  @override
  _LeaderboardWidgetState createState() => _LeaderboardWidgetState();
}

final String token = globals.token;

class _LeaderboardWidgetState extends State<LeaderboardWidget> {
  List _leaderboardData = [];

  bool points = true;

  Future<void> _fetchLeaderboardData() async {
    try {
      final response = await Dio().get(
        'https://simsvendapi-production.up.railway.app/user/leaderboard',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      setState(() {
        _leaderboardData = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchLeaderboardData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Førertavle'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Text(
                        'Points',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        setState(() {
                          points = true;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        child: Text(
                          'Elo',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          setState(() {
                            points = false;
                          });
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: _leaderboardData.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _leaderboardData.length,
                      itemBuilder: (context, index) {
                        if (points) {
                          _leaderboardData.sort((a, b) => b["UserStats"]
                                  ["points"]
                              .compareTo(a["UserStats"]["points"]));
                        } else {
                          _leaderboardData.sort((a, b) => b["UserStats"]["elo"]
                              .compareTo(a["UserStats"]["elo"]));
                        }
                        final data = _leaderboardData[index];
                        if (points)
                          return ListTile(
                            leading: Text((index + 1).toString()),
                            title: Text(
                                '${data['userInfo']["first_name"]} ${data['userInfo']["last_name"]}'),
                            subtitle:
                                Text('${data['UserStats']["points"]} points'),
                          );
                        else if (points == false) {
                          return ListTile(
                            leading: Text((index + 1).toString()),
                            title: Text(
                                '${data['userInfo']["first_name"]} ${data['userInfo']["last_name"]}'),
                            subtitle: Text('${data['UserStats']["elo"]} elo'),
                          );
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
