import 'package:flutter/material.dart';

class Fruta extends StatefulWidget {

  Fruta({Key key, this.precioFruta, this.nombreFruta, this.identificadorFruta, this.obtenerTotal}) : super(key: key);

  final int precioFruta;
  final String nombreFruta;
  final String identificadorFruta;

  final Function(int) obtenerTotal;
  
  @override
  _FrutaState createState() => _FrutaState();
}

class _FrutaState extends State<Fruta> {

  int _cantidadFruta = 0;

  void onCantidadFrutaChange(int cambio) {
    setState(() {
      _cantidadFruta = cambio + _cantidadFruta;
      widget.obtenerTotal(_cantidadFruta * widget.precioFruta);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Card(
          child: Text(widget.nombreFruta + " ($_cantidadFruta)"),
        ),
        Card(
          child: Row(
            children: <Widget>[
              MaterialButton(
                child: Icon(Icons.add),
                onPressed: () {
                  onCantidadFrutaChange(1);
                },
              ),
              MaterialButton(
                child: Icon(Icons.remove),
                onPressed: () {
                  onCantidadFrutaChange(-1);
                },
              ),
            ],
          )
        ),
      ],
    );
  }
}