import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Services/FireDatabase.dart';
import 'package:proyecto_final/UI/BurbujaMensajes.dart';
import 'package:proyecto_final/UI/NavDrawer.dart';

class Chat extends StatefulWidget {
  final String idconversacion;
  final String logemail;

  Chat(this.idconversacion, this.logemail);

  @override
  _ChatState createState() => _ChatState(this.idconversacion, this.logemail);
}

class _ChatState extends State<Chat> {
  String idconversacion="";
  String logemail="";
  DatabaseThings fireDB = new DatabaseThings();
  Stream<QuerySnapshot> chats;
  TextEditingController mensajeaenviar = new TextEditingController();
_ChatState(this.idconversacion, this.logemail);
  Widget chatMessages(){
    return StreamBuilder(
      stream: chats,
      builder: (context, snapshot){
        return snapshot.hasData ?  ListView.builder(
          itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index){
              return BurbujaMensaje(
                mensaje: snapshot.data.documents[index].data["mensaje"],
                enviadopor: logemail == snapshot.data.documents[index].data["enviadopor"],
              );
            }) : Container();
      },
    );
  }



  @override
  void initState() {
    fireDB.getMensajes(idconversacion).then((val) {
      setState(() {
        chats = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text("Traeme algo!"), backgroundColor: Colors.red[400]),
      body: Container(
        child: Stack(
          children: [
            chatMessages(),
            Container(alignment: Alignment.bottomCenter,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                color: Colors.red[400],
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          controller: mensajeaenviar,                          
                          decoration: InputDecoration(
                              hintText: "Escribe algo...",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              border: InputBorder.none
                          ),
                        )),
                    SizedBox(width: 16,),
                    GestureDetector(
                      onTap: () {
                        enviarmensajebtn();
                      },
                      child:Icon(Icons.send)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
    enviarmensajebtn() {
    if (mensajeaenviar.text.isNotEmpty) {
      Map<String, dynamic> mapmensaje = {
        "enviadopor": logemail,
        "mensaje": mensajeaenviar.text,
        "fecha": DateTime
            .now()
            .millisecondsSinceEpoch,
      };

      fireDB.enviarMensaje(idconversacion, mapmensaje);

      setState(() {
        mensajeaenviar.text = "";
      });
    }
  }

}

