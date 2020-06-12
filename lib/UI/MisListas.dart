import 'package:flutter/material.dart';
import 'package:proyecto_final/Models/Persona.dart';
import 'package:proyecto_final/UI/AgregarAmigo.dart';
import 'package:proyecto_final/UI/ListaDeAmigos.dart';
import 'package:proyecto_final/UI/NavDrawer.dart';

var contexth;

class MisListas extends StatefulWidget {
  @override
  MisListasState createState() => MisListasState();
}

class MisListasState extends State<MisListas> {
  List<Persona> amix = new List<Persona>();
  @override
  Widget build(BuildContext context) {    
    contexth = context;
    return Scaffold(
      drawer: NavDrawer(),
      appBar:
          AppBar(title: Text("Traeme algo!"), backgroundColor: Colors.red[400]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(80,30,30,30),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: "btn1",
                      backgroundColor: Colors.red[400],
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AgregarAmigo()));                        
                      },
                      tooltip: 'Agregar lista de compras',
                      child: new Icon(Icons.list)),
                  Text("   Agregar lista de compras")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80,50,30,50),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: "btn2",
                      backgroundColor: Colors.red[400],
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => ListaDeAmigos()));                      
                      },
                      tooltip: 'Historial de listas compras',
                      child: new Icon(Icons.history)),
                  Text("   Historial de listas compras")
                ],
              ),
            ),           
          ],
      
        ),
      ),
    );
  }
}
