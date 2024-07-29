import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_with_mvc/model/product.dart';

class RemoteService {
  static var client = http.Client();

  static Future<List<Product>> fetchProduct() async {
    var response = await client.get(
      Uri.parse(
          'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'),
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      List<dynamic> jsonList = jsonDecode(jsonString);
      List<Product> products =
          jsonList.map((json) => Product.fromJson(json)).toList();
      return products;
    } else {
      return [];
    }
  }
}
