import 'package:flutter/material.dart';
import 'package:flutter_application_1/Roll_DIce_Demo/gradient_container.dart';

import 'Quzz_Demo/quzz_demo_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("My App")),
        body: const Quiz(), //add this when run quzz demo
        // body: const GradientContainer(), //add this when run roll dice demo
      ),
    );
  }
}
