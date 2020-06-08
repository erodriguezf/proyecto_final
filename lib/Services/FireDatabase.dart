import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseThings{
  getUsuario(mapadeusuario){
    Firestore.instance.collection("usuarios").add(mapadeusuario);
  }
  infoUsuario(mapadeusuario){
    Firestore.instance.collection("usuarios").add(mapadeusuario);
  }
}