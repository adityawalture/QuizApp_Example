import 'package:flutter/material.dart';

class QuestionIndexDecorator extends StatelessWidget {
  const QuestionIndexDecorator(
      {super.key, required this.questionIndex, required this.isCorrectAns});
  final int questionIndex;
  final bool isCorrectAns;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAns ? Colors.green.shade100 : Colors.red.shade200,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
