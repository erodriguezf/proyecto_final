import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/Models/Persona.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:proyecto_final/Services/RequestStructure.dart';
import 'package:proyecto_final/UI/AmigoCard.dart';
import 'package:proyecto_final/UI/login.dart';
import 'package:proyecto_final/ViewModels/ControlEstados.dart';

class ListaDeAmigos extends StatefulWidget {
  @override
  ListaDeAmigosState createState() => ListaDeAmigosState();
}

class ListaDeAmigosState extends State<ListaDeAmigos> {
  List<Persona> resbusqueda = new List<Persona>();
  List<dynamic> resami;
  List<AmigoInfo> friendList;
  QuerySnapshot snapbusq;
  QuerySnapshot amifDB;
  DatabaseThings fireDB = new DatabaseThings();
  DocumentSnapshot amigos;
  bool encontrado = false;
  TextEditingController busqueda = new TextEditingController();
  
  @override
  void initState() {
    super.initState();
    final acState = Provider.of<ControlEstados>(contextsc);
    buscarListadeAmigos(acState.getEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Traeme algo!"), backgroundColor: Colors.red[400]),
      body: Column(
        children:  [_listAmigos(),
          Container(
              color: Colors.black26,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: <Widget>[],
              )),
        ],
      ),
    );
  }

  buscarListadeAmigos(String email) async {
    fireDB.getInfoUsuario(email).then((logDB) {
      //amifDB = ;
      fireDB.getAmigosdelogueado(logDB.documents[0].documentID).then((resam) {
        setState(() {
          print("aaa" + resam.data["amigos"].toString());
          resami = resam.data["amigos"];
          friendList = resami.map((e) => AmigoInfo.fromJson(e)).toList();          
          print(resami.toString());
          print("friends::: "+friendList.toString());
        });
      });
    });

  }

  Widget _listAmigos() {
    return ListView.builder(
            shrinkWrap: true,
            itemCount: friendList.length,
            itemBuilder: (context, posicion) {
              return AmigoCard(friendList[posicion]);
            });
        
  }
}
