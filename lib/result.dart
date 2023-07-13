import 'package:flutter/material.dart';
import 'package:quizzapp_2/components/question_summary.dart';
import 'package:quizzapp_2/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> choosenAnswers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          "question_index": i,
          "question": questions[i].text,
          "correct_answer": questions[i].answers[0],
          "user_answer": choosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQUestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQUestions answers correctly",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData),
            const SizedBox(height: 30),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              onPressed: onRestart,
              child: const Text("Restart Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
