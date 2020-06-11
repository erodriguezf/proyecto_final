import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/UI/Amigos.dart';
import 'package:proyecto_final/UI/NavDrawer.dart';
import 'package:proyecto_final/UI/login.dart';
import 'package:proyecto_final/ViewModels/ControlEstados.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'Amigos.dart';
// import 'Lista.dart';
import 'MiLista.dart';

var contexth;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final acState = Provider.of<ControlEstados>(contextsc);
  @override
  void initState() {
    super.initState();
    acState.getlogin ? Home() : Islogged();
  }

  @override
  Widget build(BuildContext context) {
    contexth = context;
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text("Inicio"), backgroundColor: Colors.red[400]),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          color: Colors.white,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0), // exterior
                padding: const EdgeInsets.all(10.0), // interior
                color: Colors.red[400],
                alignment: Alignment.center,
                child: new Text("BingMe Somenting",
                    style: new TextStyle(fontSize: 20.0)),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: RawMaterialButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MiLista()))},
                      elevation: 2.0,
                      fillColor: Colors.red[400],
                      child: Text("Mi lista",style: TextStyle(fontSize: 20),),
                      padding: EdgeInsets.all(50.0),
                      shape: CircleBorder(),
                    )),
                   Padding(
                padding: const EdgeInsets.all(50.0),
                child: RawMaterialButton(
                  onPressed: () => { Navigator.push(contexth,
                        MaterialPageRoute(builder: (contexth) => Amigos()))},
                      elevation: 2.0,
                      fillColor: Colors.red[400],
                      child: Text("Amigos",style: TextStyle(fontSize: 20),),
                      padding: EdgeInsets.all(50.0),
                      shape: CircleBorder(),
                    )),
              
            ],
          ),
        ),
      )
    );
  }
}
