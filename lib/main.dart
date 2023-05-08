import 'package:cantinho_da_bru/domain/load_salgados.dart';
import 'package:cantinho_da_bru/domain/load_trufas.dart';
import 'package:cantinho_da_bru/domain/shopping_bag.dart';
import 'package:cantinho_da_bru/firebase_options.dart';
import 'package:cantinho_da_bru/presentation/screen/main/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CantinhoDaBruApp());
}

class CantinhoDaBruApp extends StatelessWidget {
  const CantinhoDaBruApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cantinho da Bru',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFB34248)),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoadTrufas()),
          ChangeNotifierProvider(create: (context) => LoadSalgados()),
          ChangeNotifierProvider(create: (context) => ShoppingBag()),
        ],
        child: const MainScreen(),
      ),
    );
  }
}
