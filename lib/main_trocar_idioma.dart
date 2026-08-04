import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const IdiomaApp());
}

class IdiomaApp extends StatefulWidget {
  const IdiomaApp({super.key});

  @override
  State<IdiomaApp> createState() => _IdiomaAppState();
}

class _IdiomaAppState extends State<IdiomaApp> {
  bool idiomaIngles = false;

  @override
  void initState() {
    super.initState();
    carregarIdioma();
  }

  Future<void> salvarIdioma(bool valor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('idiomaIngles', valor);
  }

  Future<void> carregarIdioma() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      idiomaIngles = prefs.getBool('idiomaIngles') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text(
            idiomaIngles
                ? "English Language"
                : "Idioma Português",
          ),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                idiomaIngles ? "English" : "Português",
                style: const TextStyle(fontSize: 24),
              ),

              const SizedBox(height: 20),

              Text(
                idiomaIngles
                    ? "Hello User"
                    : "Olá Usuário",
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("portugues"),

                  Switch(
                    value: idiomaIngles,
                    onChanged: (valor) {
                      setState(() {
                        idiomaIngles = valor;
                      });

                      salvarIdioma(valor);
                    },
                  ),

                  const Text("ingles"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}