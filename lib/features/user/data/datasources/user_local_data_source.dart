import 'package:mind/features/user/data/models/user_model.dart';
import 'package:mind/utils/errors/exceptions.dart';
import 'package:mind/utils/local_storage/storage_utility.dart';

import '../../business/entities/user_intity.dart';

abstract class UserLocalDataSource {
  Future<UserModel> getUser();

  Future<UserEntity> saveUser({required UserEntity user});

  Future<String?> changeUserImage({required String path});
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
  Future<String?> changeUserImage({required String path}) async {
    try {
      final storage = ULocalStorage.instance();
      List users = await storage.readData('users');
      final user = users[0];
      user[userImage] = path;

      await storage.saveData('users', users);

      return path;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<UserModel> getUser() async {
    try {
      final storage = ULocalStorage.instance();
      List users = await storage.readData('users');
      final user = users[0];

      return UserModel.fromJson(user as Map<String, dynamic>);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<UserEntity> saveUser({required UserEntity user}) async {
    try {
      final storage = ULocalStorage.instance();
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
    } catch (e) {
      throw CacheException();
    }
  }
}
