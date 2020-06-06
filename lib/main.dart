import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'UI/login.dart';
import 'ViewModels/AccountState.dart';
void main() {
runApp(
  ChangeNotifierProvider(
    
  builder: (context) => AccountState(),  
  
  child:Login(),
  ),
);
}
