import 'package:decimal/decimal.dart';

class Produto {
  final int codigo;
  final String nomeProd;
  final Decimal precoProd;
  final String descricaoProd;
  final int qtdEstoque;
  final String fotProd;
  final String categoria;

  Produto({
    required this.codigo,
    required this.nomeProd,
    required this.precoProd,
    required this.descricaoProd,
    required this.qtdEstoque,
    required this.fotProd,
    required this.categoria,
  });

  factory Produto.fromJson(Map<String, dynamic> json){
  return Produto(
    // Para números, use tryParse com um valor padrão
    codigo: int.tryParse(json["Codigo"]?.toString() ?? '') ?? -1, 
    
    // Para Strings, use o operador '??'
    nomeProd: json["NomeProd"] ?? 'Nome Indisponível', 
    
    precoProd: Decimal.tryParse(json["Preco"]?.toString() ?? '') ?? Decimal.zero, 
    
    descricaoProd: json["Descricao"] ?? 'Sem descrição', 
    
    qtdEstoque: int.tryParse(json["QtdEstoque"]?.toString() ?? '') ?? 0, 
    
    fotProd: json["FotProd"] ?? '',
    
    categoria: json["Categoria"] ?? 'Sem categoria',
  );
}

}
