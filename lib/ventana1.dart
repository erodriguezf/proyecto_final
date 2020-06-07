import 'package:flutter/material.dart';

class Ventana1 extends StatelessWidget {
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
                    child: new Text("One row", style: new TextStyle(fontSize: 20.0)),
                  ),

                  Container(
                    margin: const EdgeInsets.all(10.0),  // exterior
                    padding: const EdgeInsets.all(10.0),  // interior
                    color: Colors.deepOrange,
                    alignment: Alignment.center,
                    child: new Text("Other row", style: new TextStyle(fontSize: 20.0)),
                   )

            
            ],
          ),
        ])

     );

   }
}

Widget _row(BuildContext context, String text, Widget destination) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => destination),
                    )
                  },
              child: Text(text)),
          SizedBox(height: 20.0)
        ]);
  }