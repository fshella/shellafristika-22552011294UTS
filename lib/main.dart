import 'package:flutter/material.dart';
import 'package:flutter_shellafristika/pages/edit_profil.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: EditProfil(),

    );
  }

}