// @dart=2.9
import 'package:flutter/material.dart';
import 'quiz_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz ENADE',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: QuizPage(),
    );
  }
}
