import 'package:flutter/material.dart';
import 'package:integra_catalago_app/widgets/appbar.dart';
import 'package:integra_catalago_app/widgets/drawer.dart';
import '../class/produto.dart';
import 'services/api_service.dart';

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
    _produtosFuture = ApiService.fetchProdutos();
  }

  Future<void> _refreshProdutos() async {
    setState(() {
      _produtosFuture = ApiService.fetchProdutos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const IntegraAppBar(),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFF2D3078),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: "pesquisar",
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white70,
                            ),
                            filled: true,
                            fillColor: Colors.white.withValues(alpha: 0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(color: Colors.white70),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "filtrar",
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: _refreshProdutos,
                      child: FutureBuilder(
                        future: _produtosFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Ocorreu um erro! ${snapshot.error}',
                                style: TextStyle(
                                  fontFamily: 'Alexandria',
                                  color: Colors.red,
                                ),
                              ),
                            );
                          }

                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Center(
                              child: Text('Nenhum produto encontrado.'),
                            );
                          }

                          final produtos = snapshot.data!;

                          return GridView.builder(
                            padding: const EdgeInsets.all(16),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                                        child: Icon(
                                          Icons.image,
                                          size: 50,
                                          color: Colors.amber,
                                        ),
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
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 9),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
