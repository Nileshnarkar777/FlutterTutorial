import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.questionsSummary});

  final List<Map<String, Object>> questionsSummary;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: questionsSummary.map((data) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.green, shape: BoxShape.circle),
                child: Text(
                  ((data["question_index"] as int) + 1).toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text((data["question_text"] as String),
                        style: const TextStyle(color: Colors.white)),
                    Text((data["choosen_answer"] as String),
                        style: const TextStyle(color: Colors.blue)),
                    Text((data["correct_answer"] as String),
                        style: const TextStyle(color: Colors.pink))
                  ],
                ),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}
