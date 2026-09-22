import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Distância até o endereço',
      home: const LocalizacaoPage(),
    );
  }
}

class LocalizacaoPage extends StatefulWidget {
  const LocalizacaoPage({super.key});

  @override
  State<LocalizacaoPage> createState() => _LocalizacaoPageState();
}

class _LocalizacaoPageState extends State<LocalizacaoPage> {
  // Coordenadas fixas do SESI 357 (Mococa - SP)
  final double sesiLatitude = -21.4841;
  final double sesiLongitude = -47.0078;

  // Coordenadas fixas do endereço (Av. Gabriel do Ó, 1172 - Mococa - SP)
  final double destinoLatitude = -21.4547;
  final double destinoLongitude = -47.0116;

  String resultadoDistancia = 'Clique no botão para calcular a distância.';

  void calcularDistancia() {
    // Usa Geolocator.distanceBetween() para calcular a distância em linha reta (em metros)
    double distanciaEmMetros = Geolocator.distanceBetween(
      sesiLatitude,
      sesiLongitude,
      destinoLatitude,
      destinoLongitude,
    );

    setState(() {
      if (distanciaEmMetros >= 1000) {
        double distanciaKm = distanciaEmMetros / 1000;
        resultadoDistancia = 'Distância de: ${distanciaKm.toStringAsFixed(2)} km';
      } else {
        resultadoDistancia = 'Distância de: ${distanciaEmMetros.toStringAsFixed(0)} metros';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Distância até o endereço'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.home,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Distância entre a escola SESI 357 e o consultório da minha mãe',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                resultadoDistancia,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: calcularDistancia,
                child: const Text('Calcular distância'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}