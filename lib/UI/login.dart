import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/Models/MultipleKeys.dart';
import 'package:proyecto_final/UI/Home.dart';
import 'package:proyecto_final/UI/Registro.dart';
import 'package:proyecto_final/ViewModels/ControlEstados.dart';
import 'package:string_validator/string_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

var contextsc;
bool islogd;
String usrn;
String tokn;

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     contextsc = context;
    return MaterialApp(
        title: "Me traes algo!",
        home: Scaffold(
          backgroundColor: const Color(0xff167F67),
          //resizeToAvoidBottomPadding: false,

          body: Provider.of<ControlEstados>(contextsc).getlogin
              ? Home()
              : Islogged(),
        ));
    //home: AcState.getlogin? Home():islogged());
  }
}

class Islogged extends StatefulWidget {
  Isloggedstate createState() => Isloggedstate();
}

class Isloggedstate extends State {
  bool rememberMe = false;
  @override
  void initState() {
    super.initState();
  }

  bool auxlog = true;

  //final _signUpfkey = GlobalKey<FormState>();
  final _email = new TextEditingController();
  final _password = new TextEditingController();
  Widget build(BuildContext context) {
    //contextsc = context;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
            child: Icon(
              Icons.store,
              size: 100,
            ),
          ),
          Form(
              key: MultipleKeys.loginFormKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "Sign In",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 25, 35, 25),
                      child: containerText(Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          autofocus: true,
                          cursorColor: Colors.white,
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: new InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "example@ejemplo.com",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 25, 35, 25),
                      child: containerText(Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          autofocus: true, 
                          decoration: new InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.white)),
                          obscureText: true,
                          controller: _password,
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              activeColor: Colors.white,
                              checkColor: Colors.green,
                              value: rememberMe,
                              onChanged: (bool rem) {
                                setState(() {
                                  rememberMe = rem;
                                });
                              }),
                          Text("Remember me",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                    RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text("Log In!"),
                      onPressed: () {
                        if (isEmail(_email.value.text)) {
                          onpressedlogin();
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Invalid Email or password')));
                        }
                      },
                    )
                  ],
                ),
              )),
          Text("or"),
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Text("Sign Up"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Registrar()));
            },
          ),
        ],
      ),
    );
  }

  void onpressedlogin() async {
    AuthResult user;
    try {
      user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text, password: _password.text);
    } catch (e) {
      print(e.toString());
    } finally {
      if (user != null) {
        // sign in successful!
        print("Ingreso exitoso");
        Provider.of<ControlEstados>(context, listen: false)
            .setLoggedin(_email.text, true, rememberMe);
      } else {
        // sign in unsuccessful
        print('sign in Not');
        // ex: prompt the user to try again
      }
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
