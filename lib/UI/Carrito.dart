import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:proyecto_final/Services/RequestStructure.dart';
import 'package:proyecto_final/UI/AgregarArticuloCard.dart';
import 'package:proyecto_final/UI/NavDrawer.dart';

class Carrito extends StatefulWidget {
  List<ArticulosInfoAPI> carri;
  Carrito(this.carri);
  @override
  _CarritoState createState() => _CarritoState(this.carri);
}

class _CarritoState extends State<Carrito> {
  List<ArticulosInfoAPI> carri;
  QuerySnapshot snapbusq;
  double apagar = 0;
  DatabaseThings fireDB = new DatabaseThings();
  TextEditingController busqueda = new TextEditingController();
  _CarritoState(this.carri);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text("Carrito"), backgroundColor: Colors.red[400]),
      body: Builder(
        builder: (context) => Column(
          children: [
            Row(
              children: <Widget>[
                FlatButton(
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      setState(() {
                        carri.clear();
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.remove_shopping_cart),
                        Text("Limpiar carrito")
                      ],
                    )), Text("Total a pagar: "+apagar.toString()),
              ],
            ),
            Expanded(child: _listArticulos()),
            FlatButton(
                color: Colors.grey[500],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Icon(Icons.check), Text("Publicar lista")],
                ))
          ],
        ),
      ),
    );
  }

  Widget _listArticulos() {
    return carri.length != 0
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: carri.length,
            itemBuilder: (context, posicion) {
              return AgregarArticuloCard(carri[posicion]);
            })
        : Container();
  }
}
