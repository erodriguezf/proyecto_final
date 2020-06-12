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

class Milistapropia extends StatefulWidget {
  @override
  MilistapropiaState createState() =>
      MilistapropiaState();
}

class MilistapropiaState
    extends State<Milistapropia> {
  List<Persona> resbusqueda = new List<Persona>();
  List<dynamic> resami = new List<dynamic>();
  List<dynamic> prodsami = new List<dynamic>();
  List<AmigoInfo> friendList = new List<AmigoInfo>();
  List<PublicacionInfo> publicList = new List<PublicacionInfo>();
  List<PublicacionInfo> publicAmiList = new List<PublicacionInfo>();
  DatabaseThings fireDB = new DatabaseThings();
  String lne = "No se han encontrado publicaciones de amigos";
  bool encontrado = false;
  QuerySnapshot snapbusq;
  TextEditingController busqueda = new TextEditingController();

  @override
  void initState() {
    super.initState();
    final acState = Provider.of<ControlEstados>(contextsc);
    buscarListadePublicacionesMias(acState.getEmail);
    buscarListadePublicacionesAmigos(acState.getEmail);
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
          _listPublicaciones1(),
          Text(
            "Pedido pendiente",
            style: TextStyle(fontSize: 25),
          ),
          _listPublicaciones2(),
        ],
      ),
    );
  }

  void buscarListadePublicacionesMias(String email) async {
    try {
  
          fireDB
              .buscarPublicaciones(email)
              .then((bus) {
            if (bus != null) {
              snapbusq = bus;
            }
            if (snapbusq != null) {
              if (snapbusq.documents[0].data["estado"] == "0") {
                prodsami = snapbusq.documents[0].data["Productos"];
                print(prodsami.toString());

                PublicacionInfo publicacion = PublicacionInfo(
                    docuID: snapbusq.documents[0].documentID,
                    creador: snapbusq.documents[0].data["NombreCreador"],
                    mandadero: snapbusq.documents[0].data["mandadero"],
                    valor: snapbusq.documents[0].data["Valor"],
                    productos: prodsami
                        .map((e) => ArticulosInfo.fromJson(e))
                        .toList());
                publicList.add(publicacion);
                setState(() {
                  lne = "";
                });
              }
            }
          });
        
        print("friends::: " + friendList.toString());
  
    } catch (e) {}
  }

  void buscarListadePublicacionesAmigos(String email) async {
    try {
      fireDB.getInfoUsuario(email).then((logDB) {
        if (logDB != null) {
          fireDB
              .getAmigosdelogueado(logDB.documents[0].documentID ?? " ")
              .then((resam) {
            if (resam != null) {
              print("aaa" + resam.data["amigos"].toString());
              resami = resam.data["amigos"];
              friendList = resami.map((e) => AmigoInfo.fromJson(e)).toList();
              print(resami.toString());
              for (var i = 0; i < friendList.length; i++) {
                fireDB.buscarPublicacionesMandadero(friendList[i].nombre,logDB.documents[0].email).then((bus) {
                  if (bus != null) {
                    snapbusq = bus;
                  }

                  //publicList
                  if (snapbusq != null) {
                    if (snapbusq.documents[0].data["estado"] == "0") {
                      prodsami = snapbusq.documents[0].data["Productos"];
                      print(prodsami.toString());

                      PublicacionInfo publicacion = PublicacionInfo(
                          docuID: snapbusq.documents[0].documentID,
                          creador: snapbusq.documents[0].data["NombreCreador"],
                          mandadero: snapbusq.documents[0].data["mandadero"],
                          valor: snapbusq.documents[0].data["Valor"],
                          productos: prodsami
                              .map((e) => ArticulosInfo.fromJson(e))
                              .toList());
                      publicList.add(publicacion);
                      setState(() {
                        lne = "";
                      });
                    }
                  }
                });
              }
              print("friends::: " + friendList.toString());
            }
          });
        }
      });
    } catch (e) {}
  }

  Widget _listPublicaciones1() {
    return publicList.length != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: publicList.length ?? 0,
            itemBuilder: (context, posicion) {
              return PublicacionCard(publicList[posicion]);
            })
        : Container();
  }

  Widget _listPublicaciones2() {
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
