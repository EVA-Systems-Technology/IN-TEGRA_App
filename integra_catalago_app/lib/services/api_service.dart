import 'dart:convert';
import 'package:http/http.dart' as http;
import '../class/produto.dart';


class ApiService {
  static const String _baseUrl = "http://10.0.2.2:3000";

  static Future<List<Produto>> fetchProdutos() async {
    final response = await http.get(Uri.parse("$_baseUrl/produtos"));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Produto.fromJson(e)).toList();
    } else {
      throw Exception(
        "Erro ao carregar o catálogo! Código de erro: ${response.statusCode}",
      );
    }
  }
}

