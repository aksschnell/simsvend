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

  Future<void> _fetchLeaderboardData() async {
    try {
      final response = await Dio()
          .get('https://simsvendapi-production.up.railway.app/leaderboard/1');
      setState(() {
        _leaderboardData = response.data;
      });
    } catch (e) {
      // handle error

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
      body: _leaderboardData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _leaderboardData.length,
              itemBuilder: (context, index) {
                final data = _leaderboardData[index];
                return ListTile(
                  leading: Text('${data['id']}'),
                  title: Text(
                      '${data['Player']['first_name']} ${data['Player']['last_name']}'),
                  subtitle: Text('${data['Points']} points'),
                );
              },
            ),
    );
  }
}
