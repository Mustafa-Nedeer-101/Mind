import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mind/routing/routes.dart';
import 'package:mind/core/helper_classes/get_storage_manager.dart';

class CustomMiddleware extends GetMiddleware {
  int? get proirity => 1;

  // Varialbes
  final deviceStorage = GetStorageManager.instance();

  @override
  RouteSettings? redirect(String? route) {
    final localStorage = GetStorageManager.instance();
    if (localStorage.readData('users') != null) {
      return const RouteSettings(name: Routes.home);
    }

    return null;
  }
}
