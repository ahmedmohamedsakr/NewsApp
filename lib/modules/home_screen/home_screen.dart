import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:news_app/layout/drawer_layout.dart';
import 'package:news_app/modules/home_screen/getx/home_controller.dart';
import 'package:news_app/modules/news_screen/news_screen.dart';
import 'package:news_app/modules/search_screen/search_screen.dart';
import 'package:news_app/modules/top_trending_screen/top_trending_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/components/constants.dart';

class HomeScreen extends StatelessWidget {
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerLayout(),
      appBar: AppBar(
        title: const Text(
          'Home Screen',
        ),
        actions: [
          IconButton(
            icon: Icon(IconlyBroken.search),
            onPressed: () {
              Get.to(()=>SearchScreen());
            },
          ),
          const SizedBox(
            width: 15.0,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => Row(
                children: [
                  kTabsWidget(
                    onTap: () {
                      controller.changeTab(KTabs.allNews);
                    },
                    color: (controller.currentTab.value == KTabs.allNews)
                        ? Theme.of(context).cardColor
                        : Colors.transparent,
                    title: 'All News',
                    size: (controller.currentTab.value == KTabs.allNews)
                        ? 22.0
                        : 19.0,
                  ),
                  kTabsWidget(
                    onTap: () {
                      controller.changeTab(KTabs.topTrending);
                    },
                    color: (controller.currentTab.value == KTabs.topTrending)
                        ? Theme.of(context).cardColor
                        : Colors.transparent,
                    title: 'Top Trending',
                    size: (controller.currentTab.value == KTabs.topTrending)
                        ? 22.0
                        : 19.0,
                  ),
                ],
              ),
            ),
            Obx(
              () => Container(
                child: (controller.currentTab.value == KTabs.allNews)
                    ? NewsScreen()
                    : TopTrendingScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
