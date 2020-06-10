import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/UI/login.dart';
import 'package:proyecto_final/ViewModels/ControlEstados.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                Text(
                  'Traeme algo!',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Icon(
                  Icons.store,
                  size: 100,
                  color: Colors.white,
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.red[400],
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {sharedreflogoutset(context)},
          ),
        ],
      ),
    );
  }

  void sharedreflogoutset(BuildContext context) async {
    final acState = Provider.of<ControlEstados>(context);
    acState.setLogout();
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    sharedpref.setString("email", "");
    sharedpref.setString("document", "");
    sharedpref.setBool("isloggeda", false);
    FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Login()),
      (Route<dynamic> route) => false,
    );
  }
}