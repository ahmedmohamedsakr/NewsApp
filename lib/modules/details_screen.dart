import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:news_app/shared/components/constants.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('By author'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Title ' * 20,
                  textAlign: TextAlign.justify,
                  style: titleText,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '18/07/2022',
                      style: smallText,
                    ),
                    Text(
                      'reading Time Text',
                      style: smallText,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: FancyShimmerImage(
                  errorWidget: Image.asset('assets/images/empty_image.png'),
                  imageUrl:
                      'https://images.unsplash.com/photo-1657835047328-d4f46cd0b9a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=406&q=80',
                  boxFit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 12.0,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Card(
                        elevation: 10.0,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(IconlyBroken.send,size: 28.0,),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Card(
                        elevation: 10.0,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(IconlyBroken.bookmark,size: 28.0,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  textAlign: TextAlign.justify,
                  style: titleText.copyWith(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  'description ' * 20,
                  textAlign: TextAlign.justify,
                  style: smallText,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Contents',
                  textAlign: TextAlign.justify,
                  style: titleText.copyWith(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  'content ' * 20,
                  textAlign: TextAlign.justify,
                  style: smallText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
