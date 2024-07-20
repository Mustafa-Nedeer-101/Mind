import 'package:mind/features/user/data/models/user_model.dart';
import 'package:mind/core/errors/exceptions.dart';
import 'package:mind/core/helper_classes/get_storage_manager.dart';
import '../../business/entities/user_intity.dart';

abstract class UserLocalDataSource {
  Future<UserModel> getUser();

  Future<UserEntity> saveUser({required UserEntity user});
}

const userName = 'name';
const userId = 'id';
const userPoints = 'points';
const userImage = 'image';
const userRanking = 'ranking';
const userMusicEnabled = 'musicEnabled';
const userRankingUpdate = 'rankingUpdate';

class UserLocalDataSourceImp implements UserLocalDataSource {
  @override
  @override
  Future<UserModel> getUser() async {
    try {
      final storage = GetStorageManager.instance();
      final users = await storage.readData('users');

      if (users == null) {
        throw CacheException();
      }

      final user = users[0];

      return UserModel.fromJson(user as Map<String, dynamic>);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<UserEntity> saveUser({required UserEntity user}) async {
    try {
      final storage = GetStorageManager.instance();
      List users = await storage.readData('users');
      final currentUser = users[0];

      currentUser[userId] = user.id.value;
      currentUser[userName] = user.name.value;
      currentUser[userPoints] = user.points.value;
      currentUser[userImage] = user.image.value;
      currentUser[userRanking] = user.ranking.value;
      currentUser[userMusicEnabled] = user.musicEnabled.value;
      currentUser[userRankingUpdate] = user.rankingUpdate.value;

      storage.saveData('users', users);

      return user;
    } on Exception {
      rethrow;
    }
  }
}
