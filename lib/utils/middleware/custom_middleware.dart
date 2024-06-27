import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mind/routing/routes.dart';
import 'package:mind/utils/local_storage/storage_utility.dart';

class CustomMiddleware extends GetMiddleware {
  int? get proirity => 1;

  // Varialbes
  final deviceStorage = ULocalStorage.instance();

  @override
  RouteSettings? redirect(String? route) {
    if (GetStorage('Users').read('users') != null) {
      return const RouteSettings(name: Routes.home);
    }

    return null;
  }
}
