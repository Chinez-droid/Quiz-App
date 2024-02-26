import 'package:flutter/material.dart';
import 'package:new_quiz_app/data/questions.dart';
import 'package:new_quiz_app/questions_screen.dart';
import 'package:new_quiz_app/start_screen.dart';
import 'package:new_quiz_app/results_screen.dart';

// quiz class for hosting the list of answers
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // variable for storing list of answers
  List<String> selectedAnswers = [];

  // storing startscreen as the activescreen
  var activeScreen = 'start-screen';

  // method for switching between the activescreen to the questionsscreen
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  // method for adding answers to selected answer lists
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    // conditions for averting errors after taking the quiz
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  // method for restarting the quiz
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  // method override for mapping screenWidget to StartScreen 
  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    // condition to be executed if activescreen is = questionsScreen
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    // condition to be executed if activescreen is = resultsScreen
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    // Widgets for displaying the quiz class contents
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),

          // StartScreen class called out as screenWidget
          child: screenWidget,
        ),
      ),
    );
  }
}
