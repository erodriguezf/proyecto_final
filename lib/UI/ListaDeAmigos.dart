import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/Models/Persona.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:proyecto_final/Services/RequestStructure.dart';
import 'package:proyecto_final/UI/AmigoCard.dart';
import 'package:proyecto_final/UI/NavDrawer.dart';
import 'package:proyecto_final/UI/login.dart';
import 'package:proyecto_final/ViewModels/ControlEstados.dart';

class ListaDeAmigos extends StatefulWidget {
  @override
  ListaDeAmigosState createState() => ListaDeAmigosState();
}

class ListaDeAmigosState extends State<ListaDeAmigos> {
  List<Persona> resbusqueda = new List<Persona>();
  List<dynamic> resami = new List<dynamic>();
  List<AmigoInfo> friendList = new List<AmigoInfo>();
  DatabaseThings fireDB = new DatabaseThings();
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
      drawer: NavDrawer(),
      appBar:
          AppBar(title: Text("Traeme algo!"), backgroundColor: Colors.red[400]),
      body: Column(
        children: [
          _listAmigos(),
        ],
      ),
    );
  }

  buscarListadeAmigos(String email) async {
    try{
    fireDB.getInfoUsuario(email).then((logDB) {
      fireDB.getAmigosdelogueado(logDB.documents[0].documentID??" ").then((resam) {
        setState(() {
          print("aaa" + resam.data["amigos"].toString());
          resami = resam.data["amigos"];
          friendList = resami.map((e) => AmigoInfo.fromJson(e)).toList();
          print(resami.toString());
          print("friends::: " + friendList.toString());
        });
      });
    });
    }catch(e){}
  }

  Widget _listAmigos() {
    return friendList.length != null? ListView.builder(
        shrinkWrap: true,
        itemCount: friendList.length??0,
        itemBuilder: (context, posicion) {
          return AmigoCard(friendList[posicion]);
        }):Container();
  }
}
