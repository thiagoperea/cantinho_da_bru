import 'package:cantinho_da_bru/presentation/screen/main/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CantinhoDaBruApp());
}

class CantinhoDaBruApp extends StatelessWidget {
  const CantinhoDaBruApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cantinho da Bru',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFB34248)),
      ),
      home: const MainScreen(),
    );
  }
}
