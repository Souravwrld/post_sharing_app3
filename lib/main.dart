import 'package:flutter/material.dart';
import 'package:post_sharing_app3/screens%20/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post Sharing App',
      home: HomeScreen(),
    );
  }
}
