import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

abstract class UserRemoteDataSource {
  Future<String> getRanking({required int points});
  Future<int> updatePoints({required String id, required int points});
  Future<String> createUserLink({required String name, required int points});
}

class UserRemoteDatasourceImp implements UserRemoteDataSource {
  final _db = FirebaseFirestore.instance;

  @override
  Future<String> createUserLink(
      {required String name, required int points}) async {
    try {
      DocumentReference<Map<String, dynamic>> userDoc =
          await _db.collection('Users').add({
        'name': name,
        'points': points,
      });

      return userDoc.id;
    } on FirebaseException {
      rethrow;
    } on FormatException {
      rethrow;
    } on PlatformException {
      rethrow;
    } catch (e) {
      throw 'Could not create a remote log for you!';
    }
  }

  @override
  Future<String> getRanking({required int points}) async {
    try {
      // Read from firestore
      QuerySnapshot snapshot = await _db
          .collection('Users')
          .where('points', isGreaterThan: points)
          .get();

      final usersGreater = snapshot.size;

      return (usersGreater + 1).toString();
    } on FirebaseException {
      rethrow;
    } on FormatException {
      rethrow;
    } on PlatformException {
      rethrow;
    } catch (e) {
      throw 'Could not get your points!';
    }
  }

  @override
  Future<int> updatePoints({required String id, required int points}) async {
    try {
      DocumentReference<Map<String, dynamic>> documentSnapshot =
          _db.collection('Users').doc(id);

      await documentSnapshot.update({'points': points});

      return points;
    } on FirebaseException {
      rethrow;
    } on FormatException {
      rethrow;
    } on PlatformException {
      rethrow;
    } catch (e) {
      throw 'Could not save your points!';
    }
  }
}
