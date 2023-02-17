import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/play/teammateselecter.dart';
import "court.dart";
import "date.dart";


const List<String> list = <String>['Mikkel Kronborg', 'Jakob Johansen', 'Oliver Mathiesen'];

class opponentselecter extends StatefulWidget {

  final String gamemode;
  final String single_or_double;
  final String court;
  final String teammate;
  

  const opponentselecter({super.key, required this.gamemode, required this.single_or_double, required this.court, required this.teammate});

  @override
  State<opponentselecter> createState() => _opponentselecterState();
}

class _opponentselecterState extends State<opponentselecter> {
  @override
  String dropdownValue = list.first;
  String match_players = "random";

  void initState() {


      match_players = "randoms";

    super.initState();
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(  
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),

    
 onPressed: () {


    if(widget.single_or_double == "Double")
    {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Teammateselecter(single_or_double: widget.single_or_double, gamemode: widget.gamemode, court: widget.court) ));

    }

    else {
     
      Navigator.push(context, MaterialPageRoute(builder: (context) => Court(single_or_double: widget.single_or_double, gamemode: widget.gamemode) ));


    }
  
   },


  ),
         
         
          title: Text("Vælg modstander"),
          
        ),

        body: Center(
          child: Column(





               crossAxisAlignment: CrossAxisAlignment.center,           
          mainAxisAlignment: MainAxisAlignment.center,    
            children: [


              if(widget.single_or_double == "Single")...[


        
                        Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text("Vælg modstander", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
                       ],
           if(widget.single_or_double == "Double")...[


        
                        Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text("Vælg modstandere", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),   
        
            Container(
            child:   Column(    
            
              children: [        
            
            RadioListTile(  
                title: Text("Tilfældige"),  
                value: "randoms",   
                groupValue: match_players,   
                onChanged: (value){
            
                  setState(() {  
                      match_players = value.toString();  
                  });  
                },  
            ),   
            
            RadioListTile(  
                title: Text("Egen venner"),  
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
                       ],




                       
                
                      
            

                
          if (match_players == "friends")...[



            if (widget.single_or_double == "Single")...[
              
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
                  if (widget.single_or_double == "Double")...[
              
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






           

        
             
        
              ],
               Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new SizedBox(
                    width: 76.0,
                    height: 76.0,
                    child: ElevatedButton(
                      child: Text('OK', style:  TextStyle(fontSize: 20),),
                      onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => Date(teammate: dropdownValue, single_or_double: widget.single_or_double, gamemode: widget.gamemode, court: widget.court, op1: dropdownValue, op2: dropdownValue,) ));
                      },
                    ),
                                  ),
                  ),   
              
        
            ],
          ),
        ),
      ),
    );
  }
}