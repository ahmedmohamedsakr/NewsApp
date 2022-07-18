import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/modules/details_screen.dart';
import 'package:news_app/modules/home_screen/getx/home_controller.dart';
import 'package:news_app/shared/components/constants.dart';
import 'package:news_app/shared/components/components.dart';

class NewsScreen extends StatelessWidget {
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              kTabsWidget(
                onTap: () {
                  if (controller.currentNewsPage.value != 0) {
                    controller
                        .changeNewsPage(controller.currentNewsPage.value - 1);
                  }
                },
                title: 'Prev',
                color: Colors.blue,
                borderRadius: 8.0,
              ),
              Flexible(
                flex: 2,
                child: Container(
                  height: 55.0,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Obx(
                        () => kTabsWidget(
                          onTap: () {
                            controller.changeNewsPage(index);
                          },
                          color: controller.currentNewsPage.value == index
                              ? Colors.indigo
                              : Theme.of(context).cardColor,
                          title: '${index + 1}',
                          borderRadius: 8.0,
                        ),
                      );
                    },
                  ),
                ),
              ),
              kTabsWidget(
                onTap: () {
                  if (controller.currentNewsPage.value != 4) {
                    controller
                        .changeNewsPage(controller.currentNewsPage.value + 1);
                  }
                },
                title: 'Next',
                color: Colors.blue,
                borderRadius: 8.0,
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(7.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Obx(
                () => DropdownButton(
                  items: dropDownItems,
                  onChanged: (String? value) {
                    controller.changeDropDownItem(value);
                  },
                  value: controller.sortBy.value,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => kArticlesWidget(
                context: context,
                onTap: () {
                  Get.to(()=>DetailsScreen());
                },
              ),
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropDownItems {
    return [
      DropdownMenuItem(
        value: KDropDownItems.relevancy.name,
        child: Text(
          KDropDownItems.relevancy.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      DropdownMenuItem(
        value: KDropDownItems.popularity.name,
        child: Text(
          KDropDownItems.popularity.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      DropdownMenuItem(
        value: KDropDownItems.publishedAt.name,
        child: Text(
          KDropDownItems.publishedAt.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ];
  }
}
