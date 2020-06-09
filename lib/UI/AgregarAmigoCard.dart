import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';

class AgregarAmigoCard extends StatefulWidget {
  final String nombre;
  final String username;
  final String email;
  final String selectedid;
  AgregarAmigoCard(this.nombre, this.username, this.selectedid,this.email);
  @override
  AgregarAmigoCardState createState() =>
      AgregarAmigoCardState(this.nombre, this.username, this.selectedid,this.email);
}

class AgregarAmigoCardState extends State<AgregarAmigoCard> {
  String nombre;
  String email;
  String username;
  String selectedid;
  String logueadoEmail;
  String logueadoIDoc;
  QuerySnapshot logUSDB;
  DatabaseThings fireDB = new DatabaseThings();

  AgregarAmigoCardState(this.nombre, this.username, this.selectedid,this.email);
  @override
  Widget build(BuildContext context) {
    bool agregado = false;
    return Card(
        color: Colors.red[400],
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                padding(
                    Text(nombre,
                        style: TextStyle(color: Colors.white, fontSize: 18.0)),
                    1),
                padding(
                    Text(username,
                        style: TextStyle(color: Colors.white, fontSize: 18.0)),
                    2),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Column(
                children: <Widget>[
                  FlatButton(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      fireDB.getUsuarioLogueado().then((us) {
                        logueadoEmail = us.email;
                      
                     });
                      fireDB.getInfoUsuario(logueadoEmail).then((logDB){
                        logUSDB = logDB;
                      });

                       fireDB.agregarAmigo(logUSDB.documents[0].documentID, email, nombre);
                      
                      setState(() {
                        Text("added");
                      });
                    },
                    child: agregado ? Text("Agregado") : Text("Agregar"),
                  ),
                ],
              ),
            ),
          ],
        )));
  }

  Widget padding(Widget widget, int t, [String typeTodo]) {
    Widget pa;
    switch (t) {
      case 1:
        pa =
            Padding(padding: EdgeInsets.fromLTRB(10, 30, 10, 5), child: widget);
        break;
      case 2:
        pa =
            Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 30), child: widget);
        break;
    }

    return pa;
  }
}
