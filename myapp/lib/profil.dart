import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

double _fontsize = 22;


Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/2'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}





class _ProfilState extends State<Profil> {

  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }


  @override
  Widget build(BuildContext context) {

  
    return MaterialApp(

      home: Padding(
        
        padding: const EdgeInsets.all(16.0),
        child:Scaffold(

          
        body: Center(         
          
          
          child: Column(           
                    
                    children: <Widget>[
                     

             Text("Mikkel Kronborg",style: TextStyle(fontSize: 40 ,fontWeight: FontWeight.bold),),
             Text("Alder: 23", style: TextStyle(fontSize: _fontsize)),
             Text("Elo: 1000", style: TextStyle(fontSize: _fontsize)),
             Text("Medlem siden: 18/3/2020", style: TextStyle(fontSize: _fontsize)), 
             Text("W/L: 55.4", style: TextStyle(fontSize: _fontsize)),
             Text("Kampe: 200", style: TextStyle(fontSize: _fontsize)),
             Text("Hjemmebane: PadelBoxen", style: TextStyle(fontSize: _fontsize)),
              FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
            
              return Text(snapshot.data!.title, style: TextStyle(fontSize: _fontsize));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
          


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
              
                  
                  height: 180,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 206, 206, 206),
                    border: Border.all(width: 5, color: Color.fromARGB(255, 0, 0, 0)                  
              
                    ),
                 
              
                    borderRadius: BorderRadius.all(Radius.circular(20))
              
                  ),
              
              
                  child: Padding(
              
                    
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
              
                      children: [
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

              
               Padding(
                 padding: const EdgeInsets.all(.0),
                 child: Container(
               
                  
                  height: 180,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 206, 206, 206),
                    border: Border.all(width: 5, color: Color.fromARGB(255, 0, 0, 0)                  
               
                    ),
                 
               
                    borderRadius: BorderRadius.all(Radius.circular(20))
               
                  ),
               
               
                  child: Padding(
               
                    
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
               
                      
               
                      children: [
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