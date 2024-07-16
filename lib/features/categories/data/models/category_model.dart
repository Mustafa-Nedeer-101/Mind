import 'package:mind/features/categories/business/enities/category_einity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel(
      {required super.id,
      required super.name,
      required super.image,
      required super.numberOfQuestions});

  factory CategoryModel.fromJson(Map<String, dynamic> query) {
    return CategoryModel(
        id: query['cId'],
        name: query['cName'],
        image: query['cImage'],
        numberOfQuestions: 0);
  }

  Map<String, dynamic> toJson() {
    return {
      'cId': id,
      'cName': name,
      'cImage': image,
    };
  }
}
