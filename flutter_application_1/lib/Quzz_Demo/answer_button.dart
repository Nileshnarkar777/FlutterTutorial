import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.title,
    required this.btnTapped,
  });

  final String title;
  final void Function() btnTapped;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: btnTapped,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 60, 2, 98),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: Text(title),
    );
  }
}
