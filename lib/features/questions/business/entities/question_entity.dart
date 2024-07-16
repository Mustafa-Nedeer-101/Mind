class QuestionEntity {
  int id;
  int categoryId;
  String categoryName;
  String question;
  String difficulty;
  List<String> incorrectAnswers;
  String correctAnswer;

  QuestionEntity(
      {required this.difficulty,
      required this.id,
      required this.categoryId,
      this.categoryName = '',
      required this.question,
      required this.incorrectAnswers,
      required this.correctAnswer});
}
