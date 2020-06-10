import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

     return MaterialApp(
     title: 'Escuela',
     theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),


   );
  
  }
}

class Home extends StatelessWidget{
   @override
   Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         title: Text('Bienvenido'),
       ),
        body: ListView
       (children: <Widget>[
            
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                
                  Container(
                    margin: const EdgeInsets.all(10.0),  // exterior
                    padding: const EdgeInsets.all(10.0),  // interior
                    color: Colors.deepOrange,
                    alignment: Alignment.center,
                    child: new Text("Platano", style: new TextStyle(fontSize: 20.0)),
                   ),
                  
          
             
                  Container(
                    margin: const EdgeInsets.all(10.0),  // exterior
                    padding: const EdgeInsets.all(10.0),  // interior
                    color: Colors.deepOrange,
                    alignment: Alignment.center,
                    child: new Text("Platano", style: new TextStyle(fontSize: 20.0)),
                   ),

                   Container(
                    margin: const EdgeInsets.all(10.0),  // exterior
                    padding: const EdgeInsets.all(10.0),  // interior
                    color: Colors.deepOrange,
                    alignment: Alignment.center,
                    child: new Text("Tomate", style: new TextStyle(fontSize: 20.0)),
                   ),
                   
                   Container(
                    margin: const EdgeInsets.all(10.0),  // exterior
                    padding: const EdgeInsets.all(10.0),  // interior
                   // color: Colors.deepOrange,
                    alignment: Alignment.center,
                    child: new Text("Total: ", style: new TextStyle(fontSize: 20.0)),
                   ),
                   
                   RaisedButton(
                    //margin: const EdgeInsets.all(10.0),  // exterior
                    padding: const EdgeInsets.all(10.0),  // interior
                    color: Colors.deepOrange,
                    //alignment: Alignment.center,
                    child: new Text("Agregar ", style: new TextStyle(fontSize: 20.0)),
                   ),

                   RaisedButton(
                    //margin: const EdgeInsets.all(10.0),  // exterior
                    padding: const EdgeInsets.all(10.0),  // interior
                    color: Colors.deepOrange,
                    //alignment: Alignment.center,
                    child: new Text("Actualizar y volver ", style: new TextStyle(fontSize: 20.0)),
                   ),
                  
                  
                  
                  
          
                  
            
            ]

            
          ),
        ])

     );

   }
}