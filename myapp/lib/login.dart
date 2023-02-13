import 'package:flutter/material.dart';
import 'package:myapp/profil.dart';
import 'package:myapp/register.dart';
import "home.dart";


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
                    child: 
                    
                  Image.asset('assets/logo.png',
                  height: 150,
                  scale: 2.5,                  
                  opacity:
                      const AlwaysStoppedAnimation<double>(1)), //Image.asset
                  ),

                    Text(
                    'Trophy\nHunt',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Adgangskode',
                      ),
                    ),
                  ),
                  Container(
                      height: 80,
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          
                        ),
                        child: const Text('Log In'),
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home() ));
            

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

                         Navigator.push(context, MaterialPageRoute(builder: (context) => Register() ));

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