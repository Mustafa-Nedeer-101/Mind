import 'package:get/get.dart';
import 'package:mind/features/categories/presentation/controllers/home_page_controller.dart';
import 'package:mind/features/user/presentation/controllers/profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController(), permanent: true);
    Get.put(HomeController(), permanent: true);
  }
}
