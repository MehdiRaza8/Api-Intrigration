import 'dart:convert';

import 'package:http/http.dart';

void Login(String email, password) async {
  try {
    Response response = await post(Uri.parse('https://reqres.in/api/login'),
        body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
    } else {
      print('Failed');
    }
  } catch (e) {
    print(e.toString());
  }
}
