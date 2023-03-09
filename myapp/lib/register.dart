import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "dart:io";
import 'dart:convert';
import "home.dart";
import "my_globals.dart" as globals;

final dio = Dio();

String errorMessage = "";

void register(String email, String first_name, String last_name,
    String password, context) async {
  dynamic result;

  try {
    var params = {
      "email": email,
      "first_name": first_name,
      "last_name": last_name,
      "password": password
    };
    final response = await dio.post(
      'https://simsvendapi-production.up.railway.app/auth/register/',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(params),
    );

    globals.token = response.data["token"];
    globals.user_id = response.data["user"]["ID"];

    print(globals.user_id);

    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  } on DioError catch (e) {
    print(e.message);
    errorMessage = await "Fejl";

    result = errorMessage;

    return result;
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final first_nameController = TextEditingController();
  final last_nameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Registrer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: Text('Registrer'),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                    child: Image.asset('assets/logo.png',
                        height: 150,
                        scale: 2.5,
                        opacity: const AlwaysStoppedAnimation<double>(
                            1)), //Image.asset
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: first_nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Fornavn',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: last_nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Efternavn',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: emailController,
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
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Indtast adgangskode',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: passwordRepeatController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Indtast adgangskode igen',
                      ),
                    ),
                  ),
                  Text(errorMessage),
                  Container(
                      height: 80,
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                          child: const Text('OK'),
                          onPressed: () {
                            if (first_nameController.text.isNotEmpty &&
                                last_nameController.text.isNotEmpty &&
                                emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              if (passwordController.text ==
                                  passwordRepeatController.text) {
                                register(
                                    emailController.text,
                                    first_nameController.text,
                                    last_nameController.text,
                                    passwordController.text,
                                    context);
                              } else {
                                setState(() {
                                  errorMessage = "Koderne matcher ikke";
                                });
                              }
                            } else {
                              setState(() {
                                errorMessage = "Ikke alle felter er udfyldt";
                              });
                            }
                          })),
                ],
              ),
            )));
  }
}
