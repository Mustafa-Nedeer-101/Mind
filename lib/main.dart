import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mind/firebase_options.dart';
import 'package:mind/routing/app_routes.dart';
import 'package:mind/core/helper_classes/get_storage_manager.dart';
import 'package:mind/core/theme/app_theme.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Local Get Storage Initialization
  await GetStorageManager.init('Users');

  // Make the app awake
  WakelockPlus.enable();

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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mind',
        theme: CustomAppTheme.darkTheme,
        getPages: AppRoutes.pages,
      ),
    );
  }
}
