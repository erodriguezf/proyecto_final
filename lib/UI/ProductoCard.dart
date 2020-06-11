import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:proyecto_final/Services/RequestStructure.dart';

class ProductoCard extends StatefulWidget {
  final ArticulosInfo articulo;

  ProductoCard(this.articulo);
  @override
  ProductoCardState createState() => ProductoCardState(this.articulo);
}

class ProductoCardState extends State<ProductoCard> {
  ArticulosInfo articulo;
  //String selectedid;
  //QuerySnapshot logUSDB;
  //DatabaseThings fireDB = new DatabaseThings();

  ProductoCardState(this.articulo);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //    print(amigos.nombre);
        //    Navigator.push(context,
        //        MaterialPageRoute(builder: (context) => AmigoPerfil(amigos)));
      },
      child: Card(
          color: Colors.red[400],
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
   
                 Column(

                  children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("Articulo: "+articulo.nombre ,style:TextStyle(color: Colors.white, fontSize: 22.0)),
                   ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Categoria: "+articulo.categoria,style:TextStyle(color: Colors.white, fontSize: 22.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Cantidad: "+articulo.cantidad,style:TextStyle(color: Colors.white, fontSize: 22.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Precio unitario: "+articulo.precio,style:TextStyle(color: Colors.white, fontSize: 22.0)),
                  ),
                  ],
                ), 
        
              Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Column(
                  children: <Widget>[                    
                  ],
                ),
              ),
            ],
          ))),
    );
  }
}
