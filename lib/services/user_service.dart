import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/user_Models.dart';

List<UserModels> UserList = [];
Future<List<UserModels>> getUserApi() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (var i in data) {
      UserList.add(UserModels.fromJson(i));
    }
    return UserList;
  } else {
    return UserList;
  }
}
