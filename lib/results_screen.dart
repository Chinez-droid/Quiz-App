import 'package:flutter/material.dart';
import 'package:new_quiz_app/data/questions.dart';
import 'package:new_quiz_app/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

// class for displaying the results
class ResultsScreen extends StatelessWidget {
  // constructor function for results screen
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  // variable to store the restart function & chosen answers
  final void Function() onRestart;
  final List<String> chosenAnswers;

  // method for returning the summary data
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    // loop to populate the data
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          // key & value pairs
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // storing the summary data, total number of questions & number of correct questions as an object
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    // column widget since it's vertically displayed
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
