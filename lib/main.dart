import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'UI/login.dart';
import 'ViewModels/ControlEstados.dart';
void main() {
runApp(
  ChangeNotifierProvider(
    
  builder: (context) => ControlEstados(),  
  
  child:Login(),
  ),
);
}
