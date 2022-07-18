import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/shared/components/constants.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/styles/themes.dart';

class HomeController extends GetxController {
  bool isDark = CacheHelper.getData(key: 'theme');
  Rx<KTabs> currentTab = KTabs.allNews.obs;

  changeTheme(BuildContext context) {
    isDark = !isDark;
    Get.changeTheme(Themes.themeData(isDark, context));
    CacheHelper.setData(key: 'theme', value: isDark);
  }

  void changeTab(KTabs value) {
    currentTab.value =
        value; //this must be currentTab.value or it will not work will.
  }

  var currentNewsPage = 0.obs;

  void changeNewsPage(int value) {
    currentNewsPage.value = value;
  }

  RxString sortBy = KDropDownItems.relevancy.name.obs;

  changeDropDownItem(String? value) {
    sortBy.value = value!;
  }

  var progress = 0.0.obs;

  void changeProgress(int value) {
    progress.value = value/100.0;
  }
}
