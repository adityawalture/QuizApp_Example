import 'package:flutter/material.dart';
import 'package:quizzapp_2/components/questions_screen.dart';
import 'package:quizzapp_2/components/startScreen.dart';
import 'package:quizzapp_2/data/questions.dart';
import 'package:quizzapp_2/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  //to restart quiz
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswers,
      );
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);

    //if statement will chechk the selectedAnswers to the
    //total no. of questions and if the selected answers are equal to the questions
    //then quiz will close and the result page will be displayed
    // ignore: unrelated_type_equality_checks
    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = ResultScreen(
          choosenAnswers: selectedAnswers,
          onRestart: restartQuiz,
        );
      });
    }
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswers,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 87, 43, 163),
              Color.fromARGB(255, 115, 65, 201),
              Color.fromARGB(255, 153, 110, 227),
            ],
          ),
        ),
        child: activeScreen,
      ),
    );
  }
}
