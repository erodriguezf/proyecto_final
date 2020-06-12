import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:proyecto_final/Services/RequestStructure.dart';
import 'package:proyecto_final/UI/CarritoCard.dart';
import 'package:proyecto_final/UI/NavDrawer.dart';

List<double> subtotales = new List<double>();
List<String> cantidades = new List<String>();
List<Map<String,String>> publicadosa = new List<Map<String,String>>();
class Carrito extends StatefulWidget {
  final List<ArticulosInfoAPI> carri;
  Carrito(this.carri);
  @override
  _CarritoState createState() => _CarritoState(this.carri);
}

class _CarritoState extends State<Carrito> {
  List<ArticulosInfoAPI> carri = new List<ArticulosInfoAPI>();

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
                        subtotales.clear();
                        cantidades.clear();
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.remove_shopping_cart),
                        Text("Limpiar carrito")
                      ],
                    )),
                Text("Total a pagar: " + apagar.toString()),
              ],
            ),
            Expanded(child: _listArticulos()),
            FlatButton(
                color: Colors.grey[500],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  setState(() {
                    sumatoria();
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Icon(Icons.refresh), Text("Actualizar")],
                )),
            FlatButton(
                color: Colors.grey[500],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                 // try{
                  for (var i = 0; i < carri.length; i++) {
                    Map<String,String> articulo = {
                        "nombre": carri[i].nombre,
                        "categoria": carri[i].categoria,
                        "precio": carri[i].precio.toString(),
                        "cantidad": cantidades[i]};
                        setState(() {
                          publicadosa.add(articulo);
                        });                    
                  }
                  fireDB.getUsuarioLogueado().then((value) {
                    Publicacion2Info publicacin = Publicacion2Info(
                        creador: value.email,
                        mandadero: "",
                        
                        valor: apagar);
                      fireDB.subirinfoPublicacion(publicacin,"0",publicadosa);  
                  });
                 // }catch(e){}
                },

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Icon(Icons.check), Text("Guardar lista")],
                ))
          ],
        ),
      ),
    );
  }

  void sumatoria() {
    for (var i = 0; i < subtotales.length; i++) {
      apagar = apagar + subtotales[i];
    }
  }

  Widget _listArticulos() {
    return carri.length != 0
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: carri.length,
            itemBuilder: (context, posicion) {
              return CarritoCard(carri[posicion], posicion);
            })
        : Container();
  }
}
