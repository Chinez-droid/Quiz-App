import 'package:flutter/material.dart';

// class for hosting the answer buttons
class AnswerButton extends StatelessWidget {
  // constructors holding the answer text & the click function
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  //objects for the answer button & click function
  final String answerText;
  final void Function() onTap;

  // method override for returning the button & text display
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(answerText, textAlign: TextAlign.center),
    );
  }
}
