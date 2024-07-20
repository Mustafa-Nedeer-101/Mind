import 'package:get/get.dart';
import 'package:mind/features/categories/business/usecases/get_categories_usecase.dart';
import 'package:mind/features/categories/data/datasources/categories_local_datasource.dart';
import 'package:mind/features/categories/data/repositories/category_repo_imp.dart';
import 'package:mind/core/errors/failure.dart';
import '../../business/enities/category_einity.dart';

class HomeController extends GetxController {
  // Repository
  CategoryRepoImp repository =
      CategoryRepoImp(dataSource: CategoriesLocalDataSourceImp());

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
        await GetCategoriesUsecase(categoryRepo: repository).call();

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