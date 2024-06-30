import 'package:get/get.dart';
import 'package:mind/features/quiz/data/ranking_repo.dart';
import 'package:mind/features/quiz/models/category.dart';
import 'package:mind/utils/audio/background_audio_utility.dart';
import 'package:mind/utils/database/database_utility.dart';
import 'package:mind/utils/local_storage/storage_utility.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // Variables
  final storage = ULocalStorage.instance();
  final RankingRepo rankingRepo = Get.put(RankingRepo());
  final UDatabase databaseUtility = Get.put(UDatabase());

  RxBool isLoading = true.obs;
  RxInt ranking = 0.obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    try {
      // Start the Background Music Controller
      await BackgroundMusicController.start();
      await getCategories(); // From Local Database
      await getRanking(); // From Firestore Database
    } catch (e) {
      //
      // ignore: avoid_print
      print(e.toString());
    }

    isLoading.value = false;
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
