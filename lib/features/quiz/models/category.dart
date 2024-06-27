class CategoryModel {
  final int cId;
  final String cName;
  final String cImage;

  CategoryModel({required this.cId, required this.cName, required this.cImage});

  factory CategoryModel.fromJson(Map<String, dynamic> query) {
    return CategoryModel(
        cId: query['cId'], cName: query['cName'], cImage: query['cImage']);
  }

  Map<String, dynamic> toJson() {
    return {
      'cId': cId,
      'cName': cName,
      'cImage': cImage,
    };
  }
}
