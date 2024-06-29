import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mind/utils/local_storage/storage_utility.dart';

class RankingRepo extends GetxController {
  final _db = FirebaseFirestore.instance;

  final storage = ULocalStorage.instance();

  // Get The ranking for first user in Local Storage
  Future<int> fetchRanking() async {
    try {
      final List users = await storage.readData('users');

      final Map<String, dynamic> user = users[0];

      // Read from firestore
      QuerySnapshot snapshot = await _db
          .collection('Users')
          .where('points', isGreaterThan: user['points'])
          .get();

      final usersGreater = snapshot.size;

      return usersGreater + 1;
    } catch (e) {
      throw "Could not get user ranking: $e";
    }
  }
}
