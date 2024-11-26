import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:my_movie_app/core/service/hive_service.dart';
import 'package:my_movie_app/models/movie_entities.dart';
import 'package:my_movie_app/my_translate.dart';
import 'package:my_movie_app/shareController.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter(); // Khởi tạo Hive
  // Hive.registerAdapter(MovieEntitiesAdapter());
  HiveService().init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp();
  ShareController shareController = Get.put(ShareController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(()=> GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      translations: MyTranslations(), // Đa ngôn ngữ
      locale:Locale(shareController.language.value), // Ngôn ngữ mặc định
      // fallbackLocale: const Locale('en', 'US'), // Ngôn ngữ dự phòng
      theme: ThemeData.light(), // Chế độ sáng
      darkTheme: ThemeData.dark(), // Chế độ tối
      themeMode: ThemeMode.system, // Dựa vào hệ thống
      initialBinding: DependenciesBinding(),
      initialRoute: AppRouter.SPLASH_PAGE,
      getPages: AppRouter.listGetPage,
    ));
  }
}

class DependenciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareController());
  }
}