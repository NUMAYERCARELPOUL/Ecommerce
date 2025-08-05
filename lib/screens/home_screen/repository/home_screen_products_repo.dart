import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../model/home_screen_hot_products_model.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((e) => Product.fromJson(e)).toList();
      } else {
        throw HttpException('Server returned status code ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('No Internet connection. Please check your connection.');
    } on FormatException {
      throw Exception('Bad response format from server.');
    } on HttpException catch (e) {
      throw Exception('HTTP Error: ${e.message}');
    } catch (e) {
      throw Exception('Something went wrong: $e');
    }
  }
}
