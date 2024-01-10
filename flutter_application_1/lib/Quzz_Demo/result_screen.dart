import 'package:flutter/material.dart';
import 'package:flutter_application_1/Quzz_Demo/Data/questions.dart';
import 'package:flutter_application_1/Quzz_Demo/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswers, required this.restartquzz});

  final List<String> choosenAnswers;
  final Function restartquzz;

  List<Map<String, Object>> getSummaryOfQuestions() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question_text': questions[i].questionTitle,
        'correct_answer': questions[i].options[0],
        'choosen_answer': choosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var questionsSummary = getSummaryOfQuestions();
    var totalQuestions = questions.length;
    var totalCorrectQuestions = questionsSummary.where(
      (e) {
        return e["choosen_answer"] == e["correct_answer"];
      },
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You have answers $totalCorrectQuestions out of $totalQuestions questions!",
                style: const TextStyle(color: Colors.white)),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(questionsSummary: questionsSummary),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                restartquzz();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: const Text("Restart Quzz"),
            )
          ],
        ),
      ),
    );
  }
}
