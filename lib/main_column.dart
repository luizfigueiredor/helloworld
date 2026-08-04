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
          title: Text("Exemplo Column"),
          ),
          body:Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Icon(Icons.star, size: 50),

              Text(
                "Flutter Layout",
                style: TextStyle(fontSize:24),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Clique aqui"),
              )
             ],
            ),
          ),
        ),
      );
  }
}