import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/UI/Amigos.dart';
import 'package:proyecto_final/UI/login.dart';
import 'package:proyecto_final/ViewModels/ControlEstados.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Amigos.dart';

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
          AppBar(title: Text("Home"), backgroundColor: Colors.black),
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
                        color: Colors.deepOrange,
                        alignment: Alignment.center,
                        child: new Text("BingMe Somenting",
                            style: new TextStyle(fontSize: 20.0)),
                      ),

                     //Spacer(),

                     Expanded(
                          flex: 4,
                          child: Container(
                            margin: const EdgeInsets.all(10.0), // exterior
                            padding: const EdgeInsets.all(10.0), // interior
                            color: Colors.deepOrange,
                            alignment: Alignment.center,
                            child: new Text("Mi Lista",
                                style: new TextStyle(fontSize: 20.0)),
                          )),

                      //Spacer(),

                      Expanded(
                          flex: 4,
                          child: Container(
                            margin: const EdgeInsets.all(10.0), // exterior
                            padding: const EdgeInsets.all(10.0),
                            child: RaisedButton(
                            color: Colors.deepOrange,
                             
                                 onPressed: () => {
                                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Amigos()),
                    ),
                          
                          },

                          child: new Text("Amigos",
                                style: new TextStyle(fontSize: 20.0),
                                ),


                            ),
                          )),

                      //Spacer(),

                       Expanded(
                          flex: 4,
                          child: Container(
                            margin: const EdgeInsets.all(10.0), // exterior
                            padding: const EdgeInsets.all(10.0), // interior
                            color: Colors.deepOrange,
                            alignment: Alignment.center,
                            child: new Text("Opciones",
                            style: new TextStyle(fontSize: 20.0)),
                          )
                          ),


            

          ],
        ),
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
