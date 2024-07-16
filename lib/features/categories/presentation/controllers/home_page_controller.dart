import 'package:get/get.dart';
import 'package:mind/features/categories/business/usecases/get_categories.dart';
import 'package:mind/features/categories/data/datasources/categories_local_datasource.dart';
import 'package:mind/features/categories/data/repositories/category_repo_imp.dart';
import 'package:mind/utils/database/database_utility.dart';
import 'package:mind/utils/errors/failure.dart';

import '../../business/enities/category_einity.dart';

class CustomHomeController extends GetxController {
  // UDatabase
  static final UDatabase database = Get.put(UDatabase());

  // Repository
  CategoryRepoImp repository = CategoryRepoImp(
      dataSource: CategoriesLocalDataSourceImp(database: database));

  // For Widget Display
  Failure? failure;
  List<CategoryEntity>? categories;

  @override
  void onInit() async {
    super.onInit();

    eitherFailureOrCategories();
  }

  void eitherFailureOrCategories() async {
    final failureOrCategories =
        await GetCategories(categoryRepo: repository).call();

    failureOrCategories.fold(
      (newFailure) {
        categories = null;
        failure = newFailure;
        update();
      },
      (newCategories) {
        categories = newCategories;
        failure = null;
        update();
      },
    );
  }
}
