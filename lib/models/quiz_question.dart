class QuizQuestion {
  final String question;
  final List<String> answers;

  const QuizQuestion(this.question, this.answers);

  List<String> getShuffledAnswers() {
    final answers = this.answers.toList();
    answers.shuffle();
    return answers;
  }
}