import "dart:io";

import "package:dio/dio.dart";

import "my_globals.dart" as globals;

String dateConvert(String date) {
  final splitted = date.split("T");
  date = splitted[0];

  return date;
}

void setFriends(List<dynamic> list) {
  globals.friends.clear();

  for (int i = 0; i < list.length; i++) {
    String ID = list[i]["Friend"]["ID"].toString();
    String first_name = list[i]["Friend"]["userInfo"]["first_name"];
    String last_name = list[i]["Friend"]["userInfo"]["last_name"];

    globals.friends.add(ID + " " + first_name + " " + last_name);

    print(globals.friends);
  }
}

Future<List<dynamic>> fetchFriends() async {
  List result = [];

  final String token = globals.token;

  try {
    final response = await Dio().get(
        'https://simsvendapi-production.up.railway.app/friends/' + 1.toString(),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Authorization": "Bearer $token",
        }));

    result = response.data;

    setFriends(result);
  } catch (e) {
    print(e);
  }
  return result;
}
