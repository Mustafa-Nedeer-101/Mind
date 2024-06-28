import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mind/routing/routes.dart';
import 'package:mind/utils/local_storage/storage_utility.dart';

class CustomMiddleware extends GetMiddleware {
  int? get proirity => 1;

  // Varialbes
  final deviceStorage = ULocalStorage.instance();

  @override
  RouteSettings? redirect(String? route) {
    final localStorage = ULocalStorage.instance();
    if (localStorage.readData('users') != null) {
      return const RouteSettings(name: Routes.home);
    }

    return null;
  }
}
