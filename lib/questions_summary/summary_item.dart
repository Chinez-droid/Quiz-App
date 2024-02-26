import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:new_quiz_app/questions_summary/question_identifier.dart';

// class used for indicating the answers that users selected along with the actual correct answers
class SummaryItem extends StatelessWidget {

  // constructors for the user answer & the correct answer
  const SummaryItem(this.itemData, {super.key});

  // objects for the user answer & the correct answer
  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {

    // method to check if the user answer is the correct answer
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    // returning the display widget based on users selection 
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(width: 20),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemData['question'] as String,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(itemData['user_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 202, 171, 252),
                )),
            Text(itemData['correct_answer'] as String,
                style:
                    const TextStyle(color: Color.fromARGB(255, 181, 254, 246))),
          ],
        )),
      ],
    );
  }
}
