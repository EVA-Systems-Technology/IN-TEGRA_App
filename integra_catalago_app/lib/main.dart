import 'package:flutter/material.dart';
import 'package:integra_catalago_app/class/produto.dart';
import 'package:integra_catalago_app/page_def.dart';
import 'package:integra_catalago_app/page_produto.dart';
import 'page_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IN-TEGRA Catálogo',
      debugShowCheckedModeBanner: false,

      //talvez colocar aqui uma centralização do theme do app? e definir as
      //rotas pra evitar escrever muito codigo igual. Também quero fazer o
      //drawer ficar em um "widget" proprio igual eu fiz com o api_service.dart (feito lmao)
      // vou deixar o productCard como um widget modular tbm !
      initialRoute: '/home',

      routes: {
        '/home': (context) => const HomePage(),
        '/deficiencias': (context) => const DefPage(),

        'produto': (context) => ProdutoPage(
          produto: ModalRoute.of(context)!.settings.arguments as Produto,
        ),
      },
    );
  }
}
