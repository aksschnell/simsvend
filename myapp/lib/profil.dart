import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';


class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

double _fontsize = 30;



class _ProfilState extends State<Profil> {
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
             
            ],
            
          ),
        ),
      ),
      ),


    );
  }
}