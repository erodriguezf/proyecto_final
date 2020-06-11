import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Models/UsuarioRegistrado.dart';

class FireAuth {
  final FirebaseAuth instancia = FirebaseAuth.instance;

  Future registrarNuevoUsuario(
      String email, String passwd, BuildContext context) async {
    try {
      final AuthResult res = await instancia.createUserWithEmailAndPassword(
          email: email, password: passwd);
          FirebaseUser usera = res.user;
          return usuarioexistente(usera);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  UsuarioRegistrado usuarioexistente(FirebaseUser user) {
    return user != null ? UsuarioRegistrado(id: user.uid, email: user.email) : null;
  }

  Future signOut() async {
    try {
      return await instancia.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
