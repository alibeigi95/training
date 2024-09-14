import 'package:flutter/material.dart';
import 'package:training/radio_example.dart';

import 'buttons_example.dart';
import 'checkbox_example.dart';
import 'switch_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
      ),
      home: const ButtonsExample(),
    );
  }
}

