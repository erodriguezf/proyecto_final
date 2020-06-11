import "package:flutter/material.dart";
import 'package:proyecto_final/Widgets/Fruta.dart';

class MiLista extends StatefulWidget {
  @override
  _MiListaState createState() => _MiListaState();
}

class _MiListaState extends State<MiLista> {

  List<Fruta> _frutas = new List<Fruta>();
  int _precioTotalLista = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListView.builder(
          itemCount: _frutas.length,
          itemBuilder: (BuildContext context, int index) {
            return _frutas[index];
          },
        ),
        Container( // Container usado para los botones de configuración
          child: Column(
            children: <Widget>[
              Text("Total: $_precioTotalLista"),
              MaterialButton(
                child: Text("Agregar Fruta"),
                onPressed: () {
                  _agregarFruta();
                },
              ),
              MaterialButton(
                child: Text("Actualizar y volver"),
                onPressed: () {
                  _regresarse();
                },
              ),
            ],
          ),
        )
      ], 
    );
  }

  void _agregarFruta() {}

  void _regresarse() {}
}
