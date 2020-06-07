import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/Models/Persona.dart';
import 'package:proyecto_final/UI/login.dart';
import 'package:proyecto_final/ViewModels/ControlEstados.dart';
import 'package:shared_preferences/shared_preferences.dart';
var contexth;
class Amigos extends StatefulWidget {
  @override
  AmigosState createState() => AmigosState();
}

class AmigosState extends State<Amigos> {
  List<Persona> amix = new List<Persona>();
  final acState = Provider.of<ControlEstados>(contextsc);
  @override
  void initState() {
    super.initState();
    acState.getlogin ? Amigos() : Islogged();
    //_getUserCourses(contextsc, acState.getUsername, acState.getToken);
  }

  @override
  Widget build(BuildContext context) {
    final acState = Provider.of<ControlEstados>(context);
    contexth = context;
    return Scaffold(
      appBar: AppBar(title: Text("School Ready!"),
      backgroundColor: Colors.black),
           body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[           
            Expanded(child: _list()),
            FloatingActionButton(
              backgroundColor: const Color(0xff167F67),
                onPressed: () {
                  //_addNewCourse(context, acState.getUsername, acState.getToken);
                },
                tooltip: 'Add Course',
                child: new Icon(Icons.add)),
          ],
        ),
      ),
    );
  }

  Widget _list() {
    return ListView.builder(
     // itemCount: coursesL.length,
      itemBuilder: (context, posicion) {       
        return Container(
              color: Colors.white10,
              alignment: AlignmentDirectional.centerStart,
            //  child: CardCourse(coursesL[posicion]),
                
              );
          //Icon(Icons.delete, color: Colors.white)),
          
       } );
      }
  



}

void sharedreflogoutset() async {
  SharedPreferences sharedpref = await SharedPreferences.getInstance();
  sharedpref.setString("tokn", "");
  sharedpref.setString("usrname", "");
  sharedpref.setBool("isloggeda", false);
}