import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/profil.dart';
import 'package:myapp/register.dart';
import "home.dart";
import 'package:dio/dio.dart';
import "my_globals.dart" as globals;

String errorMessage = "";

final dio = Dio();

void post(String email, String password, context) async {
  try {
    var params = {"email": email, "password": password};
    final response = await dio.post(
      'https://simsvendapi-production.up.railway.app/auth/login',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(params),
    );

    globals.user_id = response.data[0]["ID"];

    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  } on DioError catch (e) {
    print(e.message);
    errorMessage = await "Forkert kode eller email";
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _errorMessage = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    _errorMessage = errorMessage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Log ind',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Log ind'),
            ),
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 70, bottom: 50),
                    child: Image.asset('assets/logo.png',
                        height: 150,
                        scale: 2.5,
                        opacity: const AlwaysStoppedAnimation<double>(
                            1)), //Image.asset
                  ),
                  Text(
                    'Trophy\nHunt',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 40),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: emailController
                        ..text = 'allanandersen6996@gmail.com',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: passwordController..text = "Test",
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Adgangskode',
                      ),
                    ),
                  ),
                  Text(_errorMessage),
                  Container(
                      height: 80,
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: const Text('Log In'),
                        onPressed: () {
                          /*
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
  */

                          post(emailController.text, passwordController.text,
                              context);

                          Future.delayed(const Duration(milliseconds: 5000),
                              () {
                            setState(() {
                              _errorMessage = errorMessage;
                            });
                          });
                        },
                      )),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Glemt adgangskode?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text(
                      'Registrer',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            )));
  }
}
