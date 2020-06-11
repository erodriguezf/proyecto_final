import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/Models/Persona.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:proyecto_final/Services/RequestStructure.dart';
import 'package:proyecto_final/UI/NavDrawer.dart';
import 'package:proyecto_final/UI/PublicacionCard.dart';
import 'package:proyecto_final/UI/login.dart';
import 'package:proyecto_final/ViewModels/ControlEstados.dart';

class ListaPublicacionesDeAmigos extends StatefulWidget {
  @override
  ListaPublicacionesDeAmigosState createState() =>
      ListaPublicacionesDeAmigosState();
}

class ListaPublicacionesDeAmigosState
    extends State<ListaPublicacionesDeAmigos> {
  List<Persona> resbusqueda = new List<Persona>();
  List<dynamic> resami = new List<dynamic>();
  List<dynamic> prodsami = new List<dynamic>();
  List<AmigoInfo> friendList = new List<AmigoInfo>();
  List<PublicacionInfo> publicList = new List<PublicacionInfo>();
  DatabaseThings fireDB = new DatabaseThings();
  bool encontrado = false;
  QuerySnapshot snapbusq;
  TextEditingController busqueda = new TextEditingController();

  @override
  void initState() {
    super.initState();
    final acState = Provider.of<ControlEstados>(contextsc);

    buscarListadePublicaciones(acState.getEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
          title: Text("Lista de publicaciones"),
          backgroundColor: Colors.red[400]),
      body: Column(
        children: [
          _listPublicaciones(),
        ],
      ),
    );
  }

  buscarListadePublicaciones(String email) async {
    try {
      fireDB.getInfoUsuario(email).then((logDB) {
        fireDB
            .getAmigosdelogueado(logDB.documents[0].documentID ?? " ")
            .then((resam) {
          setState(() {
            print("aaa" + resam.data["amigos"].toString());
            resami = resam.data["amigos"];
            friendList = resami.map((e) => AmigoInfo.fromJson(e)).toList();
            print(resami.toString());
            for (var i = 0; i < friendList.length; i++) {
              fireDB.buscarPublicaciones(friendList[i].nombre).then((bus) {
                snapbusq = bus;
                //publicList
                if(snapbusq!=null){ 
                  prodsami = snapbusq.documents[0].data["Productos"];
                  print(prodsami.toString());
                PublicacionInfo publicacion = PublicacionInfo(
                  
                    docuID: snapbusq.documents[0].documentID,
                    creador: snapbusq.documents[0].data["NombreCreador"],
                    mandadero: snapbusq.documents[0].data["mandadero"],
                    valor: snapbusq.documents[0].data["Valor"],
                    productos: prodsami.map((e) => ArticulosInfo.fromJson(e)).toList());
                    publicList.add(publicacion);
         
              }});
            }
            print("friends::: " + friendList.toString());
          });
        });
      });
      return friendList;
    } catch (e) {}
  }

  Widget _listPublicaciones() {
    return publicList.length != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: publicList.length ?? 0,
            itemBuilder: (context, posicion) {
              return PublicacionCard(publicList[posicion]);
            })
        : Container();
  }
}
