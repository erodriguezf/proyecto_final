import 'package:flutter/material.dart';

class AgregarAmigo extends StatefulWidget {
  @override
  _AgregarAmigoState createState() => _AgregarAmigoState();
}

class _AgregarAmigoState extends State<AgregarAmigo> {
  TextEditingController busqueda = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("School Ready!"), backgroundColor: Colors.black),
      body: Column(
        children: [
          Container(
              color: Colors.black26,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                        controller: busqueda,
                        
                    decoration: InputDecoration(
                        hintText: "Buscar usuarios",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none),
                  )),
                  FlatButton(onPressed: null, child: Row(children: <Widget>[Icon(Icons.search),Text("Buscar")],))
                ],
              ))
        ],
      ),
    );
  }
}
