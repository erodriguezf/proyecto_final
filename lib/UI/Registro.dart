import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:proyecto_final/Models/MultipleKeys.dart';

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
  // final GlobalKey<FormState> _signUpfkey = GlobalKey<FormState>();
  final _email = new TextEditingController();
  final _password = new TextEditingController();
  final _name = new TextEditingController();
  final _username = new TextEditingController();

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
                decoration: new InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: "example@ejemplo.com",
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
              validator: (String value4) {
                if (value4.isEmpty) {
                  return 'Por favor ingrese algun texto';
                }
              },
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
                      .showSnackBar(SnackBar(content: Text('Invalid Email')));
                }
                Navigator.pop(globalContext);
              },
            )
          ],
        ));
  }

  void onpressedregistar() async {
    final AuthResult user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _email.text, password: _password.text);
            if(user!=null){
              Navigator.pop(context);
              Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Registered')));
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
