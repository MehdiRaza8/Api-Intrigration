import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../Models/post_modles.dart';

// ignore: non_constant_identifier_names
List<PostsModel> PostList = [];
Future<List<PostsModel>> getPostApi() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    PostList.clear();
    for (var i in data) {
      PostList.add(PostsModel.fromJson(i));
    }
    return PostList;
  } else {
    return PostList;
  }
}
