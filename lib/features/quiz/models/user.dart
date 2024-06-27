class UserModel {
  final int uId;
  final String uName;
  final int points;
  final int ranking;
  final String userImage;

  UserModel(
      {required this.uId,
      required this.uName,
      required this.points,
      required this.ranking,
      required this.userImage});

  factory UserModel.fromJson(Map<String, dynamic> query) {
    return UserModel(
        uId: query['uId'],
        uName: query['uName'],
        points: query['points'],
        ranking: query['ranking'],
        userImage: query['image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'uName': uName,
      'points': points,
      'ranking': ranking,
      'image': userImage
    };
  }
}
