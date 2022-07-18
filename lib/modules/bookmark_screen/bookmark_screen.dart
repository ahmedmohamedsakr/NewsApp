import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:news_app/shared/components/components.dart';

class BookmarkScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookmark',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemBuilder: (context, index) => kArticlesWidget(context: context),
          itemCount: 10,
        ),
      ),//kEmptyWidgets(image: 'assets/images/bookmark.png', text: 'You didn\'t add anything yet.'),
    );
  }
}
