import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mind/features/quiz/data/ranking_repo.dart';
import 'package:mind/features/quiz/models/category.dart';
import 'package:mind/features/quiz/models/user.dart';
import 'package:mind/utils/database/database_utility.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // Variables
  final RankingRepo rankingRepo = Get.put(RankingRepo());
  final UDatabase databaseUtility = Get.put(UDatabase());

  RxBool isLoading = true.obs;
  RxInt ranking = 0.obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  Rx<UserModel> user =
      UserModel(uId: 0, uName: '', points: 0, ranking: 0, userImage: '').obs;

  @override
  void onInit() async {
    try {
      await getUser(); // From Local Storage
      await getCategories(); // From Local Database
      await getRanking(); // From Firestore Database
    } catch (e) {
      //
      // ignore: avoid_print
      print(e.toString());
    }

    isLoading.value = false;
    super.onInit();
  }

  // Fill Categories List
  Future getCategories() async {
    final dbResponse = await databaseUtility.readDatabase('''
      SELECT * FROM Categories
    ''');

    categories.assignAll(dbResponse
        .map((r) => CategoryModel.fromJson(r as Map<String, dynamic>))
        .toList());

    return;
  }

  Future getUser() async {
    final List users = await GetStorage('Users').read('users');
    final currentUser = users[0];
    final String username = currentUser['name'];
    final int points = currentUser['points'];
    final String imageUrl = currentUser['image'];

    user.value = UserModel(
        uId: 0,
        uName: username,
        points: points,
        ranking: 198,
        userImage: imageUrl);

    return;
  }

  Future getRanking() async {
    ranking.value = await rankingRepo.fetchRanking();
  }

  // Get all questions for specific category
  Future<int> getNumOfQuestions(int cId) async {
    // Get Number of questions for this category
    List<Map<dynamic, dynamic>> queryResult = await databaseUtility
        .readDatabase(
            'SELECT COUNT(*) FROM Questions WHERE categoryId = ?', [cId]);

    int? numOfQustions =
        Sqflite.firstIntValue(queryResult as List<Map<String, Object?>>);

    return numOfQustions ?? 0;
  }

  //
}
