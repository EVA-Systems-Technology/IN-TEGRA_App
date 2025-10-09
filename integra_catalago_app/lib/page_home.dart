import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:integra_catalago_app/page_def.dart';
import '../class/produto.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Produto>> _produtosFuture;

  @override
  void initState() {
    super.initState();
    _produtosFuture = fetchProdutos();
  }

  Future<List<Produto>> fetchProdutos() async {
    final response = await http.get(Uri.parse("http://10.0.2.2:3000/produtos"));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Produto.fromJson(e)).toList();
    } else {
      throw Exception(
        "Erro ao carregar o catálogo! Código de erro: ${response.statusCode}",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("catapenes"),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: Drawer(
        backgroundColor: const Color(0x0004799c),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "Pagina principal",
                style: TextStyle(fontFamily: 'Alexandria', color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                "Tipos de deficiência",
                style: TextStyle(fontFamily: 'Alexandria', color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DefPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: _produtosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Ocorreu um erro! ${snapshot.error}',
                style: TextStyle(fontFamily: 'Alexandria', color: Colors.red),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum produto encontrado.'));
          }

          final produtos = snapshot.data!;

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Icon(Icons.image, size: 50, color: Colors.amber),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        produtos[index].nomeProd,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      'R\$ ${produtos[index].precoProd}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 9),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
