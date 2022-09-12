import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/photos.dart';

List<Photos> PhotoList = [];
Future<List<Photos>> getphotos() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    PhotoList.clear();
    for (var i in data) {
      PhotoList.add(Photos.fromJson(i));
    }
    return PhotoList;
  } else {
    return PhotoList;
  }
}
