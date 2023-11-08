import 'dart:math';

import 'package:flutter/material.dart';

class GradientContainer extends StatefulWidget {
  const GradientContainer({super.key});

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  var diceCounter = 2;

  void btnandler() {
    setState(() {
      diceCounter = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.yellow, Colors.blue])),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              width: 200,
              child: Image.asset("assets/images/dice-$diceCounter.png")),
          TextButton(onPressed: btnandler, child: const Text("TextBtn"))
        ],
      )),
    );
  }
}
