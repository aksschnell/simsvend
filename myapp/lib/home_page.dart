import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:ui';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: 

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(children: [
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                 height: 150,
                        width: 350,
                        decoration: BoxDecoration(
            
              color: const Color.fromARGB(255, 233, 233, 233),
               border: Border.all(width: 5, color: Color.fromARGB(255, 0, 0, 0)              
              
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))
                        ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Månedens præmiern sponsoret af padelboxen",  textAlign: TextAlign.center),
                    ),
                    Text("1. Plads 1000kr"),   
                    Text("2. Plads 750"),  
                    Text("3. Plads 500kr"),  

                  ]),
                )
              ),
            ),
SizedBox( 

  height: 170,  
  width: 350,

  child: Stack(
    fit: StackFit.expand,
    children: [
      Container(        

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(5),  
            border: Border.all( //<-- SEE HERE  
              width: 5,  
            ),

          ),

        child: Image.asset('assets/padel2.jpg', fit: BoxFit.cover

        ),

      ),

      ClipRRect( // Clip it cleanly. 

        child: Padding(  
          padding: const EdgeInsets.all(20.0),  
          child: Column(  
            children: [ 
        

              Text("Dine kommende kampe", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Colors.white)),

              Text("data", style: TextStyle(color: Colors.white),),

              Row(

                children: [

                  Column(  
                    children: [Text("data", style: TextStyle(color: Colors.white),),  
                    Text("hej", style: TextStyle(color: Colors.white),)],  
                  ),  
                ],  
              ),  
                Text("data", style: TextStyle(color: Colors.white),),  
            ],  
          ),  
        ),  
      ),  
    ],  
  ),  
),


new Expanded(
  child:   GridView.count(
  physics: NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 12,
  mainAxisSpacing: 12,
  crossAxisCount: 2,
  children: <Widget>[
    Container(

    
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 201, 201, 201),
          border: Border.all( //<-- SEE HERE  
              width: 3,  
            ),

      ),
     
      padding: const EdgeInsets.all(8),
      

      child: Column(
        children: [          
          
          Center(child: const Text("Top 3 elo", style: TextStyle(fontWeight: FontWeight.bold),)),       
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8),
            child: Container(child: Text("1. Lars Hellbo"),),
          ), 
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: Text("2. Morten Bindzus"),),
          ), 
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: Text("3. Jakob Johansen"),),
          ), 
        ],
      ),
    ),
    Container(

        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 201, 201, 201),
          border: Border.all( //<-- SEE HERE  
              width: 3,  
            ),

      ),
     
      padding: const EdgeInsets.all(8),
   
      child: Column(
        children: [
          
          
          Center(child: const Text("Top 3 points", style: TextStyle(fontWeight: FontWeight.bold),)),        

        
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8),
            child: Container(child: Text("1. Lars Hellbo"),),
          ), 
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: Text("2. Morten Bindzus"),),
          ), 
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: Text("3. Jakob Johansen"),),
          ), 
        ],
      ),

      
    ),
    Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 201, 201, 201),
          border: Border.all( //<-- SEE HERE  
              width: 3,  
            ),

      ),
     
      padding: const EdgeInsets.all(8),
    
      child: Column(
        children: [
          
          
          Center(child: const Text("Kamp historik", style: TextStyle(fontWeight: FontWeight.bold),)),        

        
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8),
            
            child: Container(child: Text("1. februar 2-1", style: TextStyle(color: Colors.green),),),
          ), 
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: Text("20. januar 1-2", style: TextStyle(color: Colors.red),),),
          ), 
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: Text(" 19. januar 3-0", style: TextStyle(color: Colors.green),),),
          ), 
        ],
      ),
    ),
    Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 201, 201, 201),
          border: Border.all( //<-- SEE HERE  
              width: 3,  
            ),

      ),
     
      padding: const EdgeInsets.all(8),
     
      child: Column(
        children: [
          
          
          Center(child: const Text("Nærmeste baner", style: TextStyle(fontWeight: FontWeight.bold),)),        

        
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8),
            child: Container(child: Text("PadelBoxen 25km."),),
          ), 

            Container(
                alignment: Alignment.center,
                  width: double.infinity,
              child: Padding(
                
              padding: const EdgeInsets.all(8.0),
              child: Container(child: Text("PadelPadel 40km."),),
                      ),
            ), 
         
        ],
      ),
    ),
   
  ],
),
)
          ]),
        ),
      )    
      )
    );
  }
}