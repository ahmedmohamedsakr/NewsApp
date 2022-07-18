import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/modules/home_screen/getx/home_controller.dart';
import 'package:news_app/modules/home_screen/home_screen.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/styles/themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: Themes.themeData(controller.isDark, context),
      home: HomeScreen(),
    );
  }
}
