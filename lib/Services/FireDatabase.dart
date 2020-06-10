import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseThings {
  QuerySnapshot logUSDB;
  DocumentSnapshot amigos;
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

  Future<DocumentSnapshot> getCurrentUserFromFS() async {
    final user = await FirebaseAuth.instance.currentUser();
    try {
      if (user != null) {
        print("user id is ${user.uid}");
        return Firestore.instance
            .collection('usuarios')
            .document(user.uid)
            .get();
      } else {
        print("user is null");
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> crearConversacion(mapconversacion, String documentconversacion) {
    Firestore.instance
        .collection("conversaciones")
        .document(documentconversacion)
        .setData(mapconversacion)
        .catchError((e) {
      print(e);
    });
  }

    getMensajes(String chatRoomId) async{
    return Firestore.instance
        .collection("conversaciones")
        .document(chatRoomId)
        .collection("chats")
        .orderBy("fecha")
        .snapshots();
  }

  Future<void> enviarMensaje(String chatRoomId, chatMessageData){

    Firestore.instance.collection("conversaciones")
        .document(chatRoomId)
        .collection("chats")
        .add(chatMessageData).catchError((e){
          print(e.toString());
    });
  }



  Future getAmigosdelogueado(String docu) async {
    try{
    return Firestore.instance.collection('usuarios').document(docu).get();
    }catch(e){}
  }

  Future getInfoUsuario(String email) async {
    try{
    return Firestore.instance
        .collection("usuarios")
        .where("email", isEqualTo: email)
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
    }catch(e){}
  }

  agregarAmigo(String currentuser, String email, String nombre) {
    Firestore.instance.collection("usuarios").document(currentuser).setData({
      "amigos": [
        {"email": email, "nombre": nombre}
      ]
    }, merge: true).then((value) {
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
