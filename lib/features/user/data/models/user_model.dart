import 'package:mind/features/user/business/entities/user_intity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.id,
    required super.image,
    required super.ranking,
    required super.points,
    required super.musicEnabled,
    required super.rankingUpdate,
  });

  factory UserModel.fromJson(Map<String, dynamic> query) {
    return UserModel(
      id: query['id'],
      name: query['name'],
      image: query['image'],
      points: query['points'],
      ranking: query['ranking'],
      musicEnabled: query['musicEnabled'],
      rankingUpdate: query['rankingUpdate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'points': points,
      'ranking': ranking,
      'musicEnabled': musicEnabled,
      'rankingUpdate': rankingUpdate,
    };
  }
}
