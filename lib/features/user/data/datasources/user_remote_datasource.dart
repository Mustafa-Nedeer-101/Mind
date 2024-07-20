import 'package:cloud_firestore/cloud_firestore.dart';

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
    } on Exception {
      rethrow;
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
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<int> updatePoints({required String id, required int points}) async {
    try {
      DocumentReference<Map<String, dynamic>> documentSnapshot =
          _db.collection('Users').doc(id);

      await documentSnapshot.update({'points': points});

      return points;
    } on Exception {
      rethrow;
    }
  }
}
