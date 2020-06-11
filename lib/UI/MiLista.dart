import "package:flutter/material.dart";
import 'package:proyecto_final/Widgets/Fruta.dart';

class MiLista extends StatefulWidget {
  @override
  _MiListaState createState() => _MiListaState();
}

class _MiListaState extends State<MiLista> {

  List<Fruta> _frutas = new List<Fruta>
      .generate(
          10, 
          (int index) => new Fruta(precioFruta: 100, nombreFruta: "Esterno cleido masto", identificadorFruta: "12")
      );

  int _precioTotalLista = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
        backgroundColor: Colors.redAccent,
      ),
      body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .6,
              margin: EdgeInsets.only(bottom: 16),
              child: ListView.builder(
                itemCount: _frutas.length,
                itemBuilder: (BuildContext context, int index) {
                  print(_frutas[index].precioFruta);
                  return _frutas[index];
                },
              ),
            ),
            Text(
              "Total: $_precioTotalLista",
              style: TextStyle(
                fontSize: 32
              ),
            ),
            MaterialButton(
              child: Text(
                "Agregar Fruta",
                style: TextStyle(
                  fontSize: 25
                ),
              ),
              onPressed: () {
                _agregarFruta();
              },
            ),
            MaterialButton(
              child: Text(
                "Actualizar y volver",
                style: TextStyle(
                  fontSize: 25
                ),
              ),
              onPressed: () {
                _regresarse();
              },
            ),
          ],
        )
          // Container( // Container usado para los botones de configuración
          //   child: Column(
          //     children: <Widget>[
          //       Text("Total: $_precioTotalLista"),
          //       MaterialButton(
          //         child: Text("Agregar Fruta"),
          //         onPressed: () {
          //           _agregarFruta();
          //         },
          //       ),
          //       MaterialButton(
          //         child: Text("Actualizar y volver"),
          //         onPressed: () {
          //           _regresarse();
          //         },
          //       ),
          //     ],
          //   ),
          // )
        // ], 
    );
  }

  void _agregarFruta() {}

  void _regresarse() {}
}
