import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:proyecto_final/Services/RequestStructure.dart';
import 'package:proyecto_final/UI/perfil.dart';

class AmigoCard extends StatefulWidget {
  final AmigoInfo amigos;
  AmigoCard(this.amigos);
  @override
  AmigoCardState createState() => AmigoCardState(this.amigos);
}

class AmigoCardState extends State<AmigoCard> {
  AmigoInfo amigos;
  String selectedid;
  String logueadoEmail;
  String logueadoIDoc;
  QuerySnapshot logUSDB;
  DatabaseThings fireDB = new DatabaseThings();

  AmigoCardState(this.amigos);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
    //    print(amigos.nombre);
    //    Navigator.push(context,
    //        MaterialPageRoute(builder: (context) => AmigoPerfil(amigos)));
      },
      child: Card(
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
                      Text(amigos.nombre,
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0)),
                      1),
                  padding(
                      Text(amigos.email,
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0)),
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
                      onPressed: () {},
                      child: Text("Chatear"),
                    ),
                    FlatButton(
                      color: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        print(amigos.nombre);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AmigoPerfil(amigos)));
                      },
                      child: Text("Perfil"),
                    )
                  ],
                ),
              ),
            ],
          ))),
    );
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
