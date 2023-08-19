import 'package:flutter/material.dart';
import 'package:footage_import/pages/home.dart';
import 'package:footage_import/themes/color_schemes.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      home: const Home(),
    );
  }
}
