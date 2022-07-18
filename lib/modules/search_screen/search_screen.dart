import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        IconlyBroken.arrowLeft2,
                        size: 30.0,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          focusNode: focusNode,
                          controller: textEditingController,
                          textInputAction: TextInputAction.search,
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                fontSize: 20.0,
                              ),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  IconlyBroken.closeSquare,
                                  size: 30.0,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  focusNode.unfocus();
                                },
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                kEmptyWidgets(
                  image: 'assets/images/no_news.png',
                  text: 'Ops! No search.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
