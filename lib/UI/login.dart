import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
          backgroundColor: Colors.red[400],
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
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn = new GoogleSignIn();
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
              size: 100,color: Colors.white,
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
                              checkColor: Colors.red[400],
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
                      child: Text("Iniciar sesión"),
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
          Text("o"),
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Text("Registrate"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Registrar()));
            },
          ),RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Text("Inicia sesión con Google"),
            onPressed: () {
              googlelogin();
              //Navigator.push(context,
               //   MaterialPageRoute(builder: (context) => Registrar()));
            },
          ),
        ],
      ),
    );
  }
  Future<void> googlelogin() async {
    try{
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = (await _auth.signInWithCredential(credential));

    _user = result.user;

    setState((){
      islogd = true;
    });

    }catch(e){}
    Provider.of<ControlEstados>(context, listen: false)
            .setLoggedin(_user.email, true, rememberMe);
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

        print("Ingreso fallido");

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

  Future<void> googleSignout() async{
    await _auth.signOut().then((onValue){
      _googleSignIn.signOut();
      setState((){
        islogd = false;
      });
    });
  }

}
