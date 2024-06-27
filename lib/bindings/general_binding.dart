import 'package:get/get.dart';

import 'package:mind/utils/controllers/network_manager.dart';
import 'package:mind/utils/database/database_utility.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(UDatabase());
  }
}
