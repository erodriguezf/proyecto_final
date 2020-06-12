import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:proyecto_final/Services/Frutiland.dart';
import 'package:proyecto_final/Services/RequestStructure.dart';
import 'package:proyecto_final/UI/AgregarArticuloCard.dart';
import 'package:proyecto_final/UI/Carrito.dart';
import 'package:proyecto_final/UI/NavDrawer.dart';

List<ArticulosInfoAPI> carrito = new List<ArticulosInfoAPI>();

class AgregarMiLista extends StatefulWidget {
  @override
  _AgregarMiListaState createState() => _AgregarMiListaState();
}

class _AgregarMiListaState extends State<AgregarMiLista> {
  List<ArticulosInfoAPI> resbusqueda = new List<ArticulosInfoAPI>();
  QuerySnapshot snapbusq;
  String qery = "https://frutiland.herokuapp.com/search?q=";
  String searching = "producto";
  bool encontrado = false;
  DatabaseThings fireDB = new DatabaseThings();
  TextEditingController busqueda = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar:
          AppBar(title: Text("Traeme algo!"), backgroundColor: Colors.red[400]),
      body: Builder(
        builder: (context) => Column(
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
                              hintText: "Escriba algun " + searching,
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none),
                        )),
                        FlatButton(
                            color: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                              resbusqueda.clear();
                              buscar(context);
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.search),
                                Text("Buscar")
                              ],
                            )),
                      ],
                    ),
                  ],
                )),
            Row(
              children: <Widget>[
                FlatButton(
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      setState(() {
                        searching = "Producto";
                        qery = "https://frutiland.herokuapp.com/search?q=";
                      });
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.search),
                        Text("Buscar productos")
                      ],
                    )),
                FlatButton(
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      setState(() {
                        searching = "Categoria";
                        qery =
                            "https://frutiland.herokuapp.com/search?category=";
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.search),
                        Text("Buscar categorias")
                      ],
                    ))
              ],
            ),
            Expanded(child: _listArticulos()),
            FlatButton(
                color: Colors.grey[500],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Carrito(carrito)));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.shopping_cart),
                    Text("ir al carrito")
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void buscar(BuildContext context) {
    traerArticulos(busqueda.text, qery).then((resbq) {
      resbusqueda = resbq;
    });
  }

  Widget _listArticulos() {
    return resbusqueda.length != 0
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: resbusqueda.length,
            itemBuilder: (context, posicion) {
              return AgregarArticuloCard(resbusqueda[posicion]);
            })
        : Container();
  }
}
