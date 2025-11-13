import 'package:flutter/material.dart';
import 'package:integra_catalago_app/widgets/drawer.dart';
import '../class/produto.dart';
import '../services/api_service.dart';
import 'package:gap/gap.dart';
import '../widgets/product_card.dart';
import '../widgets/appbar.dart';

class ProdutoPage extends StatefulWidget {
  final Produto produto;
  const ProdutoPage({super.key, required this.produto});

  @override
  State<ProdutoPage> createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  late Future<List<Produto>> _relatedProdutos;

  @override
  void initState() {
    super.initState();

    _relatedProdutos = _fetchRelatedProdutos();
  }

  Future<List<Produto>> _fetchRelatedProdutos() async {
    final allProdutos = await ApiService.fetchProdutos();

    return allProdutos.where((product) {
      return product.categoria == widget.produto.categoria &&
          product.codigo != widget.produto.codigo;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    const Color boxColor = Color(0xff151B55);
    const Color focusColor = Color.fromRGBO(255, 0, 84, 1);

    final String pathImage = 'assets/${widget.produto.fotProd}';

    return Scaffold(
      appBar: const IntegraAppBar(),
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              child: Image.asset(
                pathImage,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.broken_image_outlined,
                      size: 80,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),

            // container das info do produto
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(23),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.produto.nomeProd,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    'R\$ ${widget.produto.precoProd.toStringAsFixed(2).replaceAll('.', ',')}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(16),
                  Text(
                    'Quantidade Disponível',
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Alexandria',
                      fontSize: 14,
                    ),
                  ),
                  const Gap(8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      widget.produto.qtdEstoque.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Alexandria',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Gap(16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: focusColor,
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Veja mais e peça já o seu!',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),

            //container da desc
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF49508A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    'Descrição',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    widget.produto.descricaoProd,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 90),
                      fontSize: 15,
                      fontFamily: 'Alexandria',
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
