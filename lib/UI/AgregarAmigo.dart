import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Models/Persona.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:proyecto_final/UI/AgregarAmigoCard.dart';
import 'package:proyecto_final/UI/NavDrawer.dart';

class AgregarAmigo extends StatefulWidget {
  @override
  _AgregarAmigoState createState() => _AgregarAmigoState();
}

class _AgregarAmigoState extends State<AgregarAmigo> {
  List<Persona> resbusqueda = new List<Persona>();
  QuerySnapshot snapbusq;
  bool encontrado = false;
  DatabaseThings fireDB = new DatabaseThings();
  TextEditingController busqueda = new TextEditingController();
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar:
          AppBar(title: Text("Traeme algo!"), backgroundColor: Colors.red[400]),
      body: Column(
        children: [
          Container(
              color: Colors.black26,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                        controller: busqueda,
                        decoration: InputDecoration(
                            hintText: "Buscar usuarios",
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none),
                      )),
                      FlatButton(
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                          onPressed: () { buscar();},
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.search),
                              Text("Buscar")
                            ],
                          ))
                    ],
                  ),
                 
                ],
              ))
        ,_listUsuarios()],
       ),
    );
  }

  void buscar() {
    fireDB.buscarporNombre(busqueda.text).then((resbu) {
      setState(() {
        snapbusq = resbu;  
      });
      
    });
  }

  Widget _listUsuarios() {
    return snapbusq != null? 
        ListView.builder(
        shrinkWrap: true,
        itemCount: snapbusq.documents.length,
        itemBuilder: (context, posicion) {
          return AgregarAmigoCard(snapbusq.documents[posicion].data["nombre"],
              snapbusq.documents[posicion].data["Nombre de usuario"],
              snapbusq.documents[posicion].documentID,snapbusq.documents[posicion].data["email"]);
        }): Container();
  }
}
