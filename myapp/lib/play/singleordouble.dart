import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "play.dart";
import "court.dart";

class Singleordouble extends StatefulWidget {


  final String gamemode;
  const Singleordouble({super.key, required this.gamemode});  

  @override
  State<Singleordouble> createState() => _SingleordoubleState();
}

class _SingleordoubleState extends State<Singleordouble> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      
      title: "Play",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () =>  Navigator.push(
            context, MaterialPageRoute(builder: (context) => Play())),
  ),
          title: Text("Spil"),
        ),
        body: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,           
            mainAxisAlignment: MainAxisAlignment.center,   
          children: [
              Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(widget.gamemode, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("Vælg antal spillere", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Container(


              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,           
                mainAxisAlignment: MainAxisAlignment.center,             
            
            
                children: [


                  
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new SizedBox(
                    width: 150.0,
                    height: 150.0,
                    child: ElevatedButton(
                      child: Text('Single', style: TextStyle(fontSize: 20),),
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => Court(single_or_double: "Single", gamemode: widget.gamemode,) ));


                      },
                    ),
                                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new SizedBox(
                    width: 150.0,
                    height: 150.0,
                    child: ElevatedButton(
                      child: Text('Double', style:  TextStyle(fontSize: 20),),
                      onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => Court(single_or_double: "Double", gamemode: widget.gamemode,) ));

                      },
                    ),
                                  ),
                  ),
                     
                      
            
               
                
                ],
              ),
            )

            
         
          ],


        ),
        
      ),
    

    );
  }
}