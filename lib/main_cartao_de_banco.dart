import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Meu Cartão")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 200,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Banco SESI/SENAI",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.contactless, size: 25, color: Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 280),
                        Icon(Icons.sim_card, size: 40, color: Colors.amber),
                      ],
                    ),
                    SizedBox(height: 19),

                    Text(
                      "1234  5678  9012  3456",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),

                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          "Titular",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        SizedBox(width: 242),
                        Text(
                          "Validade",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Luiz Francisco",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(width: 173),
                        Text(
                          "12/34",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
