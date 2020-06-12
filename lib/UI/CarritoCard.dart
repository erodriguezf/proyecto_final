import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:proyecto_final/Services/RequestStructure.dart';
import 'package:proyecto_final/UI/AgregarMiLista.dart';

class CarritoCard extends StatefulWidget {
  final ArticulosInfoAPI articulo;
  CarritoCard(this.articulo);
  @override
  CarritoCardState createState() => CarritoCardState(this.articulo);
}

class CarritoCardState extends State<CarritoCard> {
  ArticulosInfoAPI articulo;
  DatabaseThings fireDB = new DatabaseThings();
  double subtotal;
  CarritoCardState(this.articulo);
  @override
  Widget build(BuildContext context) {
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
                    Text("Nombre: " + articulo.nombre,
                        style: TextStyle(color: Colors.white, fontSize: 18.0)),
                    1),
                Text("Categoría" + articulo.categoria,
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                Text("Subtotal: " + articulo.precio.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                padding(
                    Text("Subtotal: " + subtotal.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18.0)),
                    2),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, prefixText: "1"),
                  )
                ],
              ),
            ),
          ],
        )));
  }

  void sbtotal(double precio, int cantidad) {
    subtotal = precio * cantidad;
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
