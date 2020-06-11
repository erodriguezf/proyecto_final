import 'package:flutter/material.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:proyecto_final/Services/RequestStructure.dart';
import 'package:proyecto_final/UI/NavDrawer.dart';

class DetallesPublicacion extends StatefulWidget {
  final PublicacionInfo publicacion;
  DetallesPublicacion(this.publicacion);

  @override
  DetallesPublicacionstate createState() =>
      DetallesPublicacionstate(this.publicacion);
}

class DetallesPublicacionstate extends State<DetallesPublicacion> {
  PublicacionInfo publicacion;
  DatabaseThings fireDB = new DatabaseThings();
  String emaillog = "";
  DetallesPublicacionstate(this.publicacion);
var cont;
  @override
  Widget build(BuildContext context) {
    cont = context;
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Solicitud detallada"),
        backgroundColor: Colors.red[400],
      ),
      drawer: NavDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          headerWidget(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.person),
                Text(
                  "Encargado(a) : " + publicacion.mandadero ?? "",
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.attach_money),
                Text(
                  "Precio total: " + publicacion.valor?.toString() ?? "",
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.fastfood),
                Text(
                  "Articulo: " + publicacion.productos[0].nombre,
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.category),
                Text(
                  "Categoria: " + publicacion.productos[0].categoria,
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.format_list_numbered),
                Text(
                  "Cantidad: " + publicacion.productos[0].cantidad,
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.attach_money),
                Text(
                  "Precio unitario: " + publicacion.productos[0].precio,
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          RaisedButton(
              color: Colors.red[400],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Aceptar pedido",
                    style: TextStyle(color: Colors.white, fontSize: 22.0)),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                if (publicacion.mandadero != "") {
                  print("no puedes");                  
                } else {
                emaillog = fireDB.getEmailLogueado() as String;
                fireDB.tomarPedido(emaillog,publicacion.docuID);
                }
              }),
        ],
      ),
    );
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
          Icon(
            Icons.store,
            size: 100,
            color: Colors.white,
          ),
          new Text(
            "Solicitud de : " + publicacion.creador,
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
            child: Text(
              "     ",
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
    //flex: 1,
  }
}
