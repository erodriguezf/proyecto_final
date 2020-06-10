import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:proyecto_final/Services/RequestStructure.dart';

class AmigoPerfil extends StatefulWidget {
  final AmigoInfo amigo;

  AmigoPerfil(this.amigo);
  @override
  AmigoPerfilstate createState() => AmigoPerfilstate(this.amigo);
}

class AmigoPerfilstate extends State<AmigoPerfil> {
  AmigoInfo amigo;
  String ciudad ="";
  String edad="";
  String nombredeusuario="";
  QuerySnapshot amifDB;
  DatabaseThings fireDB = new DatabaseThings();

  AmigoPerfilstate(this.amigo);
  @override
  void initState() {
    super.initState();
    buscarListadeAmigos(amigo.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Traeme algo!"),
          backgroundColor: Colors.black,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 18, 0),
              child: Text(
                amigo.nombre,
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
            ),
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          headerWidget(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.person),
                Text(
                 "Nombre de usuario: " + nombredeusuario,
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.alternate_email),
                Text(
                  "Email: " + amigo.email,
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.location_on),
                Text(
                  "Ciudad: " + ciudad,
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.date_range),
                Text(
                  "Edad: " + edad,
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  buscarListadeAmigos(String email) async {
    fireDB.getInfoUsuario(email).then((logDB) {
      amifDB = logDB;
        setState(() {
          nombredeusuario = amifDB.documents[0].data["Nombre de usuario"];
          ciudad = amifDB.documents[0].data["ciudad"];
          edad = amifDB.documents[0].data["edad"];          
      });
    });

  }
  void infoAmigo() {
    fireDB.getInfoUsuario(amigo.email).then((logDB) {
    
    });
  }

  Widget headerWidget() {
    return new Card(
      elevation: 3,
      color: Colors.red[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Center(
            child: new Container(
              margin: EdgeInsets.only(bottom: 5.0),
              height: 20.0,
              width: 80.0,
            ),
          ),
          Text(
            'Traeme algo!',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          Icon(
            Icons.school,
            size: 100,
            color: Colors.white,
          ),
          new Text(
            "Amigo",
            textAlign: TextAlign.center,
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
            child: Text(
              amigo.nombre,
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
