import 'package:flutter/material.dart';

class Fruta extends StatefulWidget {

  Fruta({Key key, this.precioFruta, this.nombreFruta, this.identificadorFruta, this.obtenerTotal}) : super(key: key);

  final int precioFruta;
  final String nombreFruta;
  final String identificadorFruta;

  final Function(int) obtenerTotal;

  int _cantidadFruta = 0;
  
  @override
  _FrutaState createState() => _FrutaState();
}

class _FrutaState extends State<Fruta> {

  _onCantidadFrutaChange(int cambio) {
    setState(() {
      widget._cantidadFruta = widget._cantidadFruta + cambio < 0 ? 0 : widget._cantidadFruta + cambio;
    });
    widget.obtenerTotal(widget._cantidadFruta * widget.precioFruta);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text(
              "${widget.nombreFruta} (${widget._cantidadFruta})",
              style: TextStyle(
                  fontSize: 20,
              ),
            )
          ),
        ),
        MaterialButton(
          child: Icon(
            Icons.add,
            color: Colors.green,
          ),
          onPressed: () {
            _onCantidadFrutaChange(1);
          },
        ),
        MaterialButton(
          child: Icon(
            Icons.remove,
            color: Colors.red
          ),
          onPressed: () {
            _onCantidadFrutaChange(-1);
          },
        ),
      ],
    );
  }
}
