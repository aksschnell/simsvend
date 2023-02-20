import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import "dart:async";

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

double _fontsize = 22;


Future<http.Response> fetchUser() {
  return http.post(
    Uri.parse('https://simsvendapi-production.up.railway.app/stats'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'user_stats_id': "1",
    }),
  );
}



Future<User> createUser(String title) async {
  final response = await http.post(
    Uri.parse('https://simsvendapi-production.up.railway.app/stats'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class User {

  final int id;
  final int elo;
  final int Wins;
  final int losses;

  const User({
    required this.id,
    required this.elo,
    required this.Wins,
    required this.losses
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      elo: json['elo'],
      Wins: json['Wins'],
      losses: json["losses"]
    );
  }
}




class _ProfilState extends State<Profil> {



  @override
  

  @override
  Widget build(BuildContext context) {

  
    return MaterialApp(


      

      home: Scaffold(

          appBar: AppBar(
      title: const Text('Profil'),
      ),

        
      body: SingleChildScrollView(
        child: Center(         
          
          
          child: Column(           
                    
                    children: <Widget>[
                     
      
             Text("Mikkel Kronborg",style: TextStyle(fontSize: 40 ,fontWeight: FontWeight.bold),),
             Text("Alder: 23", style: TextStyle(fontSize: _fontsize)),
             Text("Elo: 1000", style: TextStyle(fontSize: _fontsize)),
             Text("Medlem siden: 18/3/2020", style: TextStyle(fontSize: _fontsize)), 
             Text("W/L: 55.4", style: TextStyle(fontSize: _fontsize)),
             Text("Kampe: 200", style: TextStyle(fontSize: _fontsize)),
             Text("Hjemmebane: PadelBoxen", style: TextStyle(fontSize: _fontsize)),

              



             
              FutureBuilder<User>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
            
              return Text(snapshot.data!.id.toString(), style: TextStyle(fontSize: _fontsize));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
      
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),

        
          
      
                
                for( var i = 5 ; i >= 1; i-- )  
              Padding(
      
      
                padding: const EdgeInsets.all(8.0),
                child: Container(
              
                  
                  height: 180,
                  width: 300,
                  decoration: BoxDecoration(


                    
                    color: ( (){ if (i % 2 == 0) return Color.fromARGB(255, 196, 196, 196);} )   (),
                    border: Border.all(width: 5, color: Color.fromARGB(255, 0, 0, 0)                  
              
                    ),
                 
              
                    borderRadius: BorderRadius.all(Radius.circular(20))
              
                  ),
              
              
                  child: Padding(
              
                    
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
              
                      children: [



                       
                          FutureBuilder<User>(
                                future: futureUser,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data!.id.toString());
                                  } else if (snapshot.hasError) {
                                    return Text('${snapshot.error}');
                                  }

                                  return const CircularProgressIndicator();
                                },
                              ),


                        
                        Text("Mikkel Kronborg", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Text("Lars Hansen", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        Text("VS", style: TextStyle(fontSize: 10),),
                        Text("Mikkel Kronborg", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        Text("Lars Hansen", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        Text("09-02-2022", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        Text("2 - 1", style: TextStyle(fontSize: 15),),
                        Text("+15", style: TextStyle(fontSize: 15, color: Colors.green),),
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
