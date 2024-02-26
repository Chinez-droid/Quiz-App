import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class for displaying the startscreen
class StartScreen extends StatelessWidget {
  // constructor function for starting the quiz
  const StartScreen(this.startQuiz, {super.key});

  // storing the startQuiz button function as an object
  final void Function() startQuiz;

  // widgets displayed at the startscreen(text, image, icon & button)
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 300),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
