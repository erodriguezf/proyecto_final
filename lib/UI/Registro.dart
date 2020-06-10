import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Models/MultipleKeys.dart';
import 'package:proyecto_final/Services/FireAuth.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:string_validator/string_validator.dart';

var globalContext;

class Registrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return MaterialApp(
        title: "Traeme algo!",
        home: Scaffold(
          backgroundColor: const Color(0xff167F67),
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("Traeme algo!"),
          ),
          body: Registrarform(),
        ));
  }
}

class Registrarform extends StatefulWidget {
  @override
  RegistrarformState createState() {
    return RegistrarformState();
  }
}

class RegistrarformState extends State {
  //final GlobalKey<FormState> _signUpfkey = GlobalKey<FormState>();
  FireAuth fireReg = new FireAuth();
  DatabaseThings fireDB = new DatabaseThings();
  final _email = new TextEditingController();
  final _password = new TextEditingController();
  final _name = new TextEditingController();
  final _username = new TextEditingController();
  final _city = new TextEditingController();
  final _age = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: MultipleKeys.signUpFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Registrate!",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            containerText(
              TextFormField(
                autofocus: true,
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: "example@ejemplo.com",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            containerText(
              TextFormField(
                autofocus: true,
                controller: _name,
                decoration: new InputDecoration(
                  labelText: "Nombre",
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: "nombre",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            containerText(
              TextFormField(
                autofocus: true,
                controller: _username,
                decoration: new InputDecoration(
                  labelText: "Nombre de usuario",
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: "nomobre112",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            containerText(
              TextFormField(
                autofocus: true,
                controller: _age,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  labelText: "Edad",
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: "56",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            containerText(
              TextFormField(
                autofocus: true,
                controller: _city,
                decoration: new InputDecoration(
                  labelText: "Ciudad",
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: "Barranquilla",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            containerText(TextFormField(
              key: MultipleKeys.signUpFormKey,
              autofocus: true,
              controller: _password,
              decoration: new InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white)),
              obscureText: true,
            )),
            RaisedButton(
              child: Text("Registrar!"),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                if (isEmail(_email.value.text)) {
                  onpressedregistar();
                } else {
                  Scaffold.of(globalContext)
                      .showSnackBar(SnackBar(content: Text('Email invalido')));
                }
                Navigator.pop(globalContext);
              },
            )
          ],
        ));
  }

  void onpressedregistar() async {
    if (_password.text.length >= 6) {
      Map<String, String> mapadeluser = {
        "edad": _age.text,
        "Nombre de usuario": _username.text,
        "nombre": _name.text,
        "email": _email.text,
        "ciudad": _city.text
      };
      fireReg
          .registrarNuevoUsuario(_email.text, _password.text, context)
          .then((res) {
        if (res != null) {
          fireDB.subirinfoUsuario(mapadeluser);
          Navigator.pop(context);
          print("registro exitoso");
        } else {
          print("error en el registro");
        }
      });
    } else {
      print("contraseña debe ser de minimo 6 caracteres");
    }
  }

  Widget containerText(Widget widg) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 3.0),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: widg,
    );
  }
}
