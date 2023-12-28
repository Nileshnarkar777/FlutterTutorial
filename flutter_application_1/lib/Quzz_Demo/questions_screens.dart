import 'package:flutter/material.dart';
import 'package:flutter_application_1/Quzz_Demo/answer_button.dart';
import 'package:flutter_application_1/Quzz_Demo/Data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onTapped});

  final void Function(String answer) onTapped;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionIndex = 0;

  void btnTapped(String answer) {
    widget.onTapped(answer);
    setState(() {
      if (questionIndex == (questions.length - 1)) {
      } else {
        questionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[questionIndex];
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
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.getShuffleAnswers().map(
                (option) {
                  return AnswerButton(
                      title: option,
                      btnTapped: () {
                        btnTapped(option);
                      });
                },
              )
            ],
          ),
        ));
  }
}
