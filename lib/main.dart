import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/model.dart';
import 'HomePage.dart';

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
      home: HomePage(),
    );
  }
}

  // Future _loadSampleJson() async {
  //   String jsonString = await rootBundle.loadString("assets/local_restaurant.json");
  //   final jsonData = json.decode(jsonString);
  //   Model model = Model.fromJson(jsonData);
  //   print(model.toString());
  // }


