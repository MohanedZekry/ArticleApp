import 'package:flutter/material.dart';
import 'package:flutter_tdd/core/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Article App',
      theme: appTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Articles App'),
        ),
      ),
    );
  }
}
