import 'package:flutter/material.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exemplo row"),
          ),
          body:Center(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Icon(Icons.home, size: 40),
              SizedBox(width:20),
              Icon(Icons.favorite,size: 40),
              SizedBox(width:50),
              Icon(Icons.settings, size:40)
             ],
            ),
          ),
        ),
      );
  }
}