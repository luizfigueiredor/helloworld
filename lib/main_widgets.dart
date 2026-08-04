import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Minha tela")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.thumb_up,size:60, color: Colors.blue),
              SizedBox(width: 20, height: 20),
              

              Text("D.S. é o melhor curso do sesi?", style:TextStyle(fontSize:22, color: const Color.fromARGB(255, 135, 234, 30))),
              SizedBox(width: 20, height: 20),
              ElevatedButton(
                onPressed: () {
                  print("Usuário clicou");
                },
                
                child: Text("Curtir", style:TextStyle(color:Color.fromARGB(255, 89, 26, 236)) ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}