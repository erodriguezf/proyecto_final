import 'package:flutter/material.dart';
import 'Login.dart';

class ProfessorDetails extends StatefulWidget {
  int email;
  String name;
  String token;
  bool logged;

  ProfessorDetails();
  @override
  ProfessorDetailsstate createState() => ProfessorDetailsstate();
}

class ProfessorDetailsstate extends State<ProfessorDetails> {
  int profeid;
  int profidcourse;
  String profname;
  String profusername;
  String profemail;
  String profphone;
  String profcity;
  String profcountry;
  String profbirthday;
  String username;
  String token;
  bool logged;
 
  @override
  void initState() {
    super.initState();
    if (logged) {
    
    } else {
      Islogged();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SchoolReady!"),backgroundColor: Colors.black, actions: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 18, 0),
          child: Text(
            username,
            style: TextStyle(fontSize: 19, color: Colors.white),
          ),
        ),
      ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          headerWidget(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 36, 8, 15),
            child: Row(
              children: <Widget>[
                Icon(Icons.confirmation_number),
                Text(
                  "Professor ID: " + profeid.toString(),
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.person),
                Text(
                  "Username: " + profusername,
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.alternate_email),
                Text(
                  "Email: " + profemail,
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.phone),
                Text(
                  "Phone: " + profphone,
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.location_on),
                Text(
                  "City: " + profcity,
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.location_city),
                Text(
                  "Country: " + profcountry,
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.date_range),
                Text(
                  "Birthday: " + profbirthday,
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

   Widget headerWidget() {
    return new Card(
      elevation: 3,
      color: const Color(0xff167F67),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Center(
            child: new Container(
              margin: EdgeInsets.only(bottom: 5.0),
              height: 20.0,
              width: 80.0,
            ),
          ),
          Text(
            'School Ready!',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          Icon(
            Icons.school,
            size: 100,
            color: Colors.white,
          ),
          new Text(
            "Professor Details",
            textAlign: TextAlign.center,
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
            child: Text(
              profname,
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  
  }
}