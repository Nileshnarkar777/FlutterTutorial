class QuizQuestion {
  const QuizQuestion(this.questionTitle, this.options);

  final String questionTitle;
  final List<String> options;

  List<String> getShuffleAnswers() {
    final shuffleList = List.of(options);
    shuffleList.shuffle();
    return shuffleList;
  }
}
