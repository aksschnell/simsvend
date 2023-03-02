import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LeaderboardWidget extends StatefulWidget {
  const LeaderboardWidget({super.key});

  @override
  _LeaderboardWidgetState createState() => _LeaderboardWidgetState();
}

class _LeaderboardWidgetState extends State<LeaderboardWidget> {
  List _leaderboardData = [];

  bool points = true;

  Future<void> _fetchLeaderboardData() async {
    try {
      final response = await Dio().get(
          'https://simsvendapi-production.up.railway.app/user/leaderboard');
      setState(() {
        _leaderboardData = response.data;

        print(_leaderboardData);

        if (points) {
          _leaderboardData.sort((a, b) =>
              b["UserStats"]["points"].compareTo(a["UserStats"]["points"]));
        } else {
          _leaderboardData.sort(
              (a, b) => b["UserStats"]["elo"].compareTo(a["UserStats"]["elo"]));
        }
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
              height: 1000,
              child: _leaderboardData.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: _leaderboardData.length,
                      itemBuilder: (context, index) {
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
