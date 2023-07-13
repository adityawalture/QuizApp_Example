import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              "assets/images/quiz-logo.png",
              width: 320,
            ),
          ),
          const SizedBox(height: 55),
          const Text(
            "Learn Flutter the Fun way!",
            style: TextStyle(
              color: Color.fromARGB(255, 192, 153, 220),
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 45),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              startQuiz();
            },
            icon: const Icon(Icons.arrow_right_alt_rounded),
            label: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
