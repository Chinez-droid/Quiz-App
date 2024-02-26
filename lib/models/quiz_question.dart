// QuizQuestion model class
class QuizQuestion {
  // constructor function for the question text & answers
  const QuizQuestion(this.text, this.answers);

  // objects for the question text & answers
  final String text;
  final List<String> answers;

  // method to shuffle the answers
  List<String> getShuffledAnswers() {
    // create a new list of answers
    final shuffledList = List.of(answers);

    // shuffle the newly created list
    shuffledList.shuffle();

    // return the updated shuffled list
    return shuffledList;
  }
}
