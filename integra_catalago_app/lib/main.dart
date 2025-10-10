import 'package:flutter/material.dart';
import 'package:integra_catalago_app/page_def.dart';
import 'page_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integra',
      debugShowCheckedModeBanner: false,
      

      //talvez colocar aqui uma centralização do theme do app? e definir as 
      //rotas pra evitar escrever muito codigo igual. Também quero fazer o 
      //drawer ficar em um "widget" proprio igual eu fiz com o api_service.dart
      initialRoute: '/',

      routes: {

        '/': (context) => const HomePage(),
        '/deficiencias': (context) => const DefPage(),
        

      },
    );
  }
}
