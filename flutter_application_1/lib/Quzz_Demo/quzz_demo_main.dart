import 'package:flutter/material.dart';
import 'package:flutter_application_1/Quzz_Demo/Data/questions.dart';
import 'package:flutter_application_1/Quzz_Demo/questions_screens.dart';
import 'package:flutter_application_1/Quzz_Demo/result_screen.dart';
import 'package:flutter_application_1/Quzz_Demo/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          choosenAnswers: selectedAnswers,
          restartquzz: restartQuzz,
        );
      });
    }
  }

  void restartQuzz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = QuestionsScreen(
        onTapped: chooseAnswer,
      );
    });
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        onTapped: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: activeScreen,
    );
  }
}
