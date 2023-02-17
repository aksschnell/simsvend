import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/play/play.dart';
import 'singleordouble.dart';
import "teammateselecter.dart";
import "opponent.dart";

const List<String> list = <String>['PadelBoxen', 'PadelPadel', 'Padel Odense'];

class Court extends StatefulWidget {
  
  final String gamemode;
  final String single_or_double;

  const Court({super.key, required this.gamemode, required this.single_or_double});
  @override
  State<Court> createState() => _CourtState();
}

class _CourtState extends State<Court> {
  
  String dropdownValue = list.first;
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
   
home: Scaffold( appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () {


    if(widget.gamemode == "Casual")
    {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Singleordouble(gamemode: widget.gamemode) ));

    }

    else if (widget.gamemode == "Competitive"){
     
      Navigator.push(context, MaterialPageRoute(builder: (context) => Play() ));


    }
  
   },
  ),
          title: Text("Bane vælger"),
        ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,           
          mainAxisAlignment: MainAxisAlignment.center,                
          
          children: [     
               Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("Vælg bane", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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

              Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new SizedBox(
                    width: 76.0,
                    height: 76.0,
                    child: ElevatedButton(
                      child: Text('OK', style:  TextStyle(fontSize: 20),),
                      onPressed: () {


                        if(widget.single_or_double == "Double")
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Teammateselecter(single_or_double: widget.single_or_double, gamemode: widget.gamemode, court: dropdownValue,) ));

                        }

                        else if(widget.single_or_double == "Single")
                        {




                          Navigator.push(context, MaterialPageRoute(builder: (context) => opponentselecter(single_or_double: widget.single_or_double, gamemode: widget.gamemode, court: dropdownValue, teammate: "none",) ));

                        }

                         
                      },
                    ),
                                  ),
                  ),      

        ]),
      ),

),

    );
  }
}