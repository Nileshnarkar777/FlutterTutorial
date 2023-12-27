import 'package:flutter/material.dart';
import 'package:flutter_application_1/Quzz_Demo/answer_button.dart';
import 'package:flutter_application_1/Quzz_Demo/Data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  void btnTapped() {}

  var currentQuestion = questions.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.questionTitle,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.options.map(
                (option) {
                  return AnswerButton(title: option, btnTapped: btnTapped);
                },
              )
            ],
          ),
        ));
  }
}
