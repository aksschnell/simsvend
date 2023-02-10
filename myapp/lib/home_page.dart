import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
                        width: 300,
                        decoration: BoxDecoration(
            
              color: const Color.fromARGB(255, 233, 233, 233),
               border: Border.all(width: 5, color: Color.fromARGB(255, 0, 0, 0)              
              
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
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
               Container(

                  height: 100,
          width: 300,
          decoration: BoxDecoration(

            color: const Color.fromARGB(255, 233, 233, 233),
             border: Border.all(width: 5, color: Color.fromARGB(255, 0, 0, 0)              
            
                   ),
                   borderRadius: BorderRadius.all(Radius.circular(20))
          ),

                 child: Column(children: const [
                   Text("lort"),
                   Text("lort"),                    
                 ]),
               ),
          
            
          ]),
        ),
      )
            
      
      
      
      )
    );
  }
}