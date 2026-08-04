import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 146, 145, 147),
        appBar: AppBar(title: Text("Mercado pago")),
        body: Center(
          child:
               Container(
               width: 350,
              height: 220,
              padding: EdgeInsets.all(8),  
            decoration: BoxDecoration(
            color: const Color.fromARGB(255, 26, 20, 27), 
              borderRadius: BorderRadius.circular(10), 
            ),
           
           
            child :
             Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               Text(
               "Mercado pago", 
              style: TextStyle(color: Colors.white),
                ),
                Icon(Icons.contactless, size: 30, color: const Color.fromARGB(255, 239, 235, 234)),
                ],
              ),
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                SizedBox(width: 20),

                Icon(Icons.sim_card, size: 30, color: const Color.fromARGB(255, 239, 235, 234)),
                  ],
                ),
                Text(
                 "1234 5678 9012 3456",
                 style:TextStyle(color: Colors.white,
                 fontSize: 22,
                 letterSpacing: 2,
                 ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Titular",
                          style: TextStyle(color: Colors.white70, fontSize:12),

                        ),
                        Text(
                          "Bianca Moreira De Oliveira",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Validade",
                          style: TextStyle(color: Colors.white70, fontSize:12),
                        ),
                        Text("12/30",
                        style:TextStyle(color:Colors.white, fontSize:16),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}