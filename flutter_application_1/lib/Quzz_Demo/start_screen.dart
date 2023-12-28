import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.clickmeTapped, {super.key});

  final void Function() clickmeTapped;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
            child: Image.asset(
          "assets/Quzz_Images/quiz-logo.png",
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        )),
        const SizedBox(height: 60),
        Text(
          "Learn the Fluter fun way!",
          style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 252), fontSize: 24),
          textAlign: TextAlign.center,
        ),
        OutlinedButton.icon(
          onPressed: clickmeTapped,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 237, 223, 252),
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text(
            "Start Quzz",
          ),
        ),
      ]),
    );
  }
}
