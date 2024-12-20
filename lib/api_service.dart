import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

Future<List<Product>> fetchProducts() async {
  final url = Uri.parse('https://api.restful-api.dev/objects'); // Replace with actual API URL
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print('Fetched Products: $data'); // Debugging
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      print('API Error: ${response.reasonPhrase}');
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  } catch (error) {
    print('Error fetching products: $error');
    throw Exception('Error fetching products: $error');
  }
}