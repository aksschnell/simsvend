import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:myapp/play/opponentselecter.dart';
import "court.dart";

const List<String> list = <String>['Mikkel Kronborg', 'Jakob Johansen', 'Oliver Mathiesen'];

class Teammateselecter extends StatefulWidget {

  final String gamemode;
  final String single_or_double;
  final String court;

  const Teammateselecter({super.key, required this.gamemode, required this.single_or_double, required this.court});

  @override
  State<Teammateselecter> createState() => _TeammateselecterState();
}

class _TeammateselecterState extends State<Teammateselecter> {


    void initState() {


    super.initState();
  }

  String match_players = "random";

    String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),

    
 onPressed: () {


    if(widget.single_or_double == "Double")
    {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => Court(single_or_double: widget.single_or_double, gamemode: widget.gamemode, court: court,) ));

    }

    else {

    }
  
   },


  ),
         
         
          title: Text("Vælg holdkammerat"),
          
        ), body: Center(
          child: Column(

               crossAxisAlignment: CrossAxisAlignment.center,           
          mainAxisAlignment: MainAxisAlignment.center,    
            children: [
        
                        Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text("Vælg holdkammerat", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),   
        
            Container(
            child:   Column(    
            
              children: [        
            
            RadioListTile(  
                title: Text("Tilfældig"),  
                value: "randoms",   
                groupValue: match_players,   
                onChanged: (value){
            
                  setState(() {  
                      match_players = value.toString();  
                  });  
                },  
            ),   
            
            RadioListTile(  
                title: Text("Egen ven"),  
                value: "friends",   
                groupValue: match_players,   
                onChanged: (value){
            
                  setState(() {  
                      match_players = value.toString();  
                  });  
                },  
            ),    
              ],  
            ),
          ),     
               
        
                
            Text(widget.single_or_double),              
            

                
          if (match_players == "friends")...[

           

        
                         DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
              }).toList(),
            ),

                  
        
              ],
               Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new SizedBox(
                    width: 76.0,
                    height: 76.0,
                    child: ElevatedButton(
                      child: Text('OK', style:  TextStyle(fontSize: 20),),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Oponentselecter(single_or_double: widget.single_or_double, gamemode: widget.gamemode, court: dropdownValue,) ));

                      },
                    ),
                                  ),
                  ),   
              
        
            ],
          ),
        )

        ,),
    );
  }
}