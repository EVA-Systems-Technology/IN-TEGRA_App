import 'package:flutter/material.dart';
import '../class/produto.dart';

class ProductCard extends StatelessWidget {
  final Produto produto;

  const ProductCard({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color.fromRGBO(39, 43, 78, 1);
    const Color priceColor = Color.fromRGBO(255, 0, 84, 1);

    final String pathImage = 'assets/${produto.fotProd}';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(
              pathImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                print("erro ao carregar a imagem em: $pathImage");
                return const Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    size: 50,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          Container(
            color: bgColor,
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(
              produto.nomeProd,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            color: priceColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'R\$ ${produto.precoProd.toStringAsFixed(2).replaceAll('.', ',')}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
