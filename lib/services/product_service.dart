import 'dart:convert';

import '../Models/product.dart';
import 'package:http/http.dart' as http;

Future<ProductsModel> getProductsApi() async {
  final response = await http.get(
      Uri.parse('https://webhook.site/4c54d958-1ba9-4061-9c2f-a31d16792e4d'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return ProductsModel.fromJson(data);
  } else {
    return ProductsModel.fromJson(data);
  }
}
