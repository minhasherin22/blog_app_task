import 'package:blog_app_task/screens/detaies_page.dart';
import 'package:blog_app_task/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: HomePage(),
       
    );
  }
}


 