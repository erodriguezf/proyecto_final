import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:proyecto_final/Services/RequestStructure.dart';

class AgregarArticuloCard extends StatefulWidget {
  final ArticulosInfoAPI articulo;
  AgregarArticuloCard(this.articulo);
  @override
  AgregarArticuloCardState createState() => AgregarArticuloCardState(this.articulo);
}

class AgregarArticuloCardState extends State<AgregarArticuloCard> {
  ArticulosInfoAPI articulo;
  DatabaseThings fireDB = new DatabaseThings();

  AgregarArticuloCardState(this.articulo);
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
                    Text("Nombre: "+articulo.nombre,
                        style: TextStyle(color: Colors.white, fontSize: 18.0)),
                    1),Text("Categoría"+articulo.categoria,
                        style: TextStyle(color: Colors.white, fontSize: 18.0)),
                padding(
                    Text("Precio: "+articulo.precio.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18.0)),
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
                    onPressed: () {  
                      setState(() {
                        Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Producto agregado al carrito',style: TextStyle(fontSize: 20),)));                      
                      });                    
                    },
                    child: Icon(Icons.add_shopping_cart),
                  ),
                ],
              ),
            ),
          ],
        )));
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
