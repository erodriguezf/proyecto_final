import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseThings {
  Future buscarporNombre(String nombre) async {
    return await Firestore.instance
        .collection("usuarios")
        .where('nombre', isEqualTo: nombre)
        .getDocuments();
  }

   Future<FirebaseUser> getUsuarioLogueado() async {
    final user = await FirebaseAuth.instance.currentUser();
    return user;
  }

   Future<DocumentSnapshot> getCurrentUserFromFS(
      FirebaseUser user) async {
    try {
      if (user != null) {
        print("user id is ${user.uid}");
        return Firestore.instance.collection('users').document(user.uid).get();
      } else {
        print("user is null");
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getInfoUsuario(String email) async {
    return Firestore.instance
        .collection("usuarios")
        .where("email", isEqualTo: email)
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
  }

  agregarAmigo(String currentuser, String email, String nombre) {

    Firestore.instance.collection("usuarios").document(currentuser).setData(
      {"amigos": [
        {
          "email": email,
          "nombre": nombre
        }

      ]
      },merge: true).then((value){
        print("agregado");
      });
      

    
       
     
    }
  

  subirinfoUsuario(Map<String, dynamic> mapadeusuario) {
    Firestore.instance
        .collection("usuarios")
        .add(mapadeusuario)
        .catchError((e) {
      print(e.toString());
    });
  }
}
