import 'package:flutter/material.dart';
import 'package:tp_cours_advanced_widgets/views/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TP advanced',
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      home:  MainPage( title: 'Tp advanced | By PinceG',)
    );
  }
}

