import 'package:flutter/material.dart';

void main() {
  runApp(LoginResponsivo());
}

class LoginResponsivo extends StatelessWidget {
  const LoginResponsivo({super.key});

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: "LoginResponsivo",
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: largura * 0.8,
                child: Column(
                  children: [
                    SizedBox(height: 20),

                    Icon(Icons.lock, size: 100, color: Colors.blue),

                    SizedBox(height: 20),

                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20),

                    TextField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: 20),

                    TextField(
                      decoration: InputDecoration(
                        labelText: "Senha",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 50,

                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Entrar"),
                      ),
                    ),
                    SizedBox(height: 20),

                    TextButton(onPressed: () {}, child: Text("Criar conta")),

                    SizedBox(height: 500),

                    TextButton(onPressed: () {}, child: Text("Esqueceu sua senha?")),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
