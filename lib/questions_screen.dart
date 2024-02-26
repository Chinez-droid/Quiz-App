import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:new_quiz_app/answer_button.dart';
import 'package:new_quiz_app/data/questions.dart';

// class hosting screen for selecting the answers
class QuestionsScreen extends StatefulWidget {
  // super constructor function for selecting the answers
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  // objects to select the answers
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // objects for starting the questions
  var currentQuestionIndex = 0;

  // method for checking the selected answers
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;

    // we can also use this as an alternative
    // currentQuestionIndex += 1;

    // and this
    setState(() {
      currentQuestionIndex++; // increments the question value by 1 while users are selecting the answers
    });
  }

  // method override
  @override
  Widget build(context) {

    // storing the currentQuestionIndex in line with questions dummy data 
    final currentQuestion = questions[currentQuestionIndex];

    // returning the displayed widgets
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
