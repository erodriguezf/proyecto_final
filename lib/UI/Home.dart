import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/UI/Amigos.dart';
import 'package:proyecto_final/UI/MiLista.dart';
import 'package:proyecto_final/UI/login.dart';
import 'package:proyecto_final/ViewModels/ControlEstados.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final acState = Provider.of<ControlEstados>(context);
    contexth = context;
    return Scaffold(
      appBar:
          AppBar(title: Text("School Ready!"), backgroundColor: Colors.black),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              child: Text('Mi lista'),
              onPressed: (){
                print("hola perro");
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Amigos()));
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return new MiLista();
                  }
                ));
              },
            ),
            MaterialButton(
              child: Text('Amigos'),
              onPressed: (){
                print("hola perro");
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Amigos()));
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return new Amigos();
                  }
                ));
              },
            ),
            MaterialButton(
              child: Text('Carrito'),
              onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Amigos()));
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return new Amigos();
                  }
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

void sharedreflogoutset() async {
  SharedPreferences sharedpref = await SharedPreferences.getInstance();
  sharedpref.setString("tokn", "");
  sharedpref.setString("usrname", "");
  sharedpref.setBool("isloggeda", false);
}
