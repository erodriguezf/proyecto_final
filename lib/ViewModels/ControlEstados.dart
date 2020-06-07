import 'package:flutter/material.dart';
import 'package:proyecto_final/UI/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlEstados with ChangeNotifier {
  ControlEstados();

  bool _isLogged = false;
  String _email;
  bool rememberme = false;

  void setLoggedin(String email,bool log, bool remember) async {
    String exist = "";
   // SharedPreferences sharedpref = await SharedPreferences.getInstance();
    exist = await sharedemailget()??"";
    if (exist.length != 0) {
      _isLogged = await sharedLoggedget();
      _email = await sharedemailget();
    } else {      
      _email = email;
      _isLogged = log;
    }
    if (remember) {
      sharedLoggedset(log);      
      sharedemailset(email);
    }

    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setLogged(bool log) {
    _isLogged = log;
    notifyListeners();
  }

  void setRememberMe(bool remember) {
    rememberme = remember;
    notifyListeners();
  }

  void setLogout() {
    _isLogged = false;
    Islogged();
    notifyListeners();
  }


  bool get getlogin => _isLogged;
  String get getEmail => _email;
  bool get getrememberMe => rememberme;

  Future<String> sharedemailget() async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    return sharedpref.getString("email");
  }

  Future<bool> sharedLoggedget() async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    return sharedpref.getBool("isloggeda") ?? false;
  }

  Future<bool> sharedemailset(String username) async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    return sharedpref.setString("email", username);
  }

  Future<bool> sharedLoggedset(bool log) async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    return sharedpref.setBool("isloggeda", log);
  }
}