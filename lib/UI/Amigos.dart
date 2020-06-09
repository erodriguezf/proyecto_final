import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/Models/Persona.dart';
import 'package:proyecto_final/UI/AgregarAmigo.dart';
import 'package:proyecto_final/UI/login.dart';
import 'package:proyecto_final/ViewModels/ControlEstados.dart';

var contexth;

class Amigos extends StatefulWidget {
  @override
  AmigosState createState() => AmigosState();
}

class AmigosState extends State<Amigos> {
  List<Persona> amix = new List<Persona>();
  final acState = Provider.of<ControlEstados>(contextsc);
  @override
  void initState() {
    super.initState();
    acState.getlogin ? Amigos() : Islogged();
    
  }

  @override
  Widget build(BuildContext context) {    
    contexth = context;
    return Scaffold(
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
                      tooltip: 'Agregar amigo',
                      child: new Icon(Icons.person_add)),
                  Text("   Agregar amigo")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80,30,30,30),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: "btn2",
                      backgroundColor: Colors.red[400],
                      onPressed: () {
                        //Navigator.push(context,MaterialPageRoute(builder: (context) => AgregarAmigo()));                      
                      },
                      tooltip: 'Lista de amigos',
                      child: new Icon(Icons.person)),
                  Text("   Lista de amigos")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80,30,30,30),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: "btn3",
                      backgroundColor: Colors.red[400],
                      onPressed: () {
                        //Navigator.push(context,MaterialPageRoute(builder: (context) => AgregarAmigo()));                        
                      },
                      tooltip: 'Posts de amigos',
                      child: new Icon(Icons.list)),
                  Text("   Posts de amigos")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
