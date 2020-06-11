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
    Future<String> getEmailLogueado() async {
    final user = await FirebaseAuth.instance.currentUser();
    return user.email;
  }

  Future crearConversacion(mapconversacion, String documentconversacion) {
    Firestore.instance
        .collection("conversaciones")
        .document(documentconversacion)
        .setData(mapconversacion)
        .catchError((e) {
      print(e);
    });
  }

  Future buscarPublicaciones(String nombre) async {
    return await Firestore.instance
        .collection("publicaciones")
        .where('NombreCreador', isEqualTo: nombre)
        .getDocuments();
  }

  getMensajes(String chatRoomId) async {
    return Firestore.instance
        .collection("conversaciones")
        .document(chatRoomId)
        .collection("chats")
        .orderBy("fecha")
        .snapshots();
  }

  Future enviarMensaje(String chatRoomId, chatMessageData) {
    Firestore.instance
        .collection("conversaciones")
        .document(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future getAmigosdelogueado(String docu) async {
    try {
      return Firestore.instance.collection('usuarios').document(docu).get();
    } catch (e) {}
  }

  Future getInfoUsuario(String email) async {
    try {
      return Firestore.instance
          .collection("usuarios")
          .where("email", isEqualTo: email)
          .getDocuments()
          .catchError((e) {
        print(e.toString());
      });
    } catch (e) {}
  }

  tomarPedido(String email, String publicacion) {
    Firestore.instance
        .collection("publicaciones")
        .document(publicacion)
        .updateData({"mandadero": email});
  }

  agregarAmigo(String currentuser, String email, String nombre) {
    Firestore.instance.collection("usuarios").document(currentuser).updateData({
      "amigos": FieldValue.arrayUnion([
        {"email": email, "nombre": nombre}
      ])
    });
    print("agregado");
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
