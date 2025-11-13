import '../widgets/product_card.dart';
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

  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _produtosFuture = ApiService.fetchProdutos();
  }

  Future<void> _refreshProdutos() async {
    setState(() {
      _searchController.clear();
      _searchText = "";
      _produtosFuture = ApiService.fetchProdutos();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
                color: Color.fromRGBO(41, 50, 118, 0.85),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff151B55),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(35),
                        top: Radius.circular(20),
                      ),
                      boxShadow: [
                        ]
                      ),
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 2),
                    child: Column(
                      children: [
                        TextField(
                          controller: _searchController,

                          onChanged: (value) {
                            setState(() {
                              _searchText = value;
                            });
                          },

                          decoration: InputDecoration(
                            hintText: "Pesquisar",
                            suffixIcon: Icon(
                              Icons.search,
                              size: 40,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Color(0xff5A5E86),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(color: Colors.white),
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

                          if (snapshot.hasData) {
                            final allProdutos = snapshot.data!;

                            final filteredProd = allProdutos.where((produtos) {
                              final nameProduto = produtos.nomeProd
                                  .toLowerCase();
                              final descProduto = produtos.descricaoProd
                                  .toLowerCase();
                              final searchMin = _searchText.toLowerCase();

                              return nameProduto.contains(searchMin) ||
                                  descProduto.contains(searchMin);
                            }).toList();

                            if (filteredProd.isEmpty) {
                              return Center(
                                child: Text(
                                  _searchText.isEmpty
                                      ? 'nenhum produto registrado'
                                      : 'Nenhum resultado para "$_searchText"',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Alexandria',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }

                            return GridView.builder(
                              padding: const EdgeInsets.all(16),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: 0.75,
                                  ),
                              itemCount: filteredProd.length,
                              itemBuilder: (context, index) {
                                final produto = filteredProd[index];

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/produto',
                                      arguments: produto,
                                    );
                                  },
                                  child: ProductCard(produto: produto),
                                );
                              },
                            );
                          }

                          return const Center(
                            child: CircularProgressIndicator(),
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
