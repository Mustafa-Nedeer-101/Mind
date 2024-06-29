// ignore_for_file: unused_local_variable
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mind/bindings/general_binding.dart';
import 'package:mind/firebase_options.dart';
import 'package:mind/routing/app_routes.dart';
import 'package:mind/utils/local_storage/storage_utility.dart';
import 'package:mind/utils/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Local Get Storage Initialization
  await ULocalStorage.init('Users');

  // Firebase Initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mind',
      theme: CustomAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
    );
  }
}
