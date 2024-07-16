class CategoryEntity {
  final int id;
  final String name;
  final String image;
  int numberOfQuestions;

  CategoryEntity(
      {required this.id,
      required this.name,
      required this.image,
      required this.numberOfQuestions});
}
