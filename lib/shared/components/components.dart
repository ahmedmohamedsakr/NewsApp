import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/components/constants.dart';

Widget kTabsWidget(
    {Color? color,
    String? title,
    double? size,
    required Function()? onTap,
    double borderRadius = 15.0}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
              letterSpacing: .6,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget kArticlesWidget({BuildContext? context}) {
  return InkWell(
    onTap: () {},
    child: Stack(
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          color: Colors.blue,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 60.0,
            height: 60.0,
            color: Colors.blue,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context!).cardColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          //width: 60.0,
          //height: 110.0,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FancyShimmerImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1657835047328-d4f46cd0b9a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=406&q=80',
                  boxFit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.height * 0.12,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'title ' * 50,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: smallText,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Text(
                          'Reading Time',
                          style: smallText,
                        ),
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            MaterialButton(
                                minWidth: 1.0,
                                onPressed: () {},
                                child: Icon(
                                  Icons.link,
                                )),
                            Text(
                              '20-12-2022 ' * 2,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              style: smallText,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget kEmptyWidgets({required String image, required String text}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Image.asset(
        image,
      ),
      Text(
        text,
        style: TextStyle(
          fontSize: 27.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}
