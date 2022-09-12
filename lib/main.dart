import 'package:api_intregrations/Models/photos.dart';
import 'package:api_intregrations/screens/home_screen.dart';
import 'package:api_intregrations/screens/photos.dart';
import 'package:api_intregrations/screens/user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserData(),
    );
  }
}
