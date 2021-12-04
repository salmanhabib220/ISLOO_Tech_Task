import 'package:flutter/material.dart';
import 'package:isloo_tech_task/Pages/Bottom_Nav_Bar.dart';


void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Homepage(),
    );
  }
}
