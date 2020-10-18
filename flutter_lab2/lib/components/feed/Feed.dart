import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab2/components/feed/FeedPreview.dart';
import 'package:flutter_lab2/components/feed/Search.dart';
import 'package:flutter_lab2/models/PostModel.dart';
import 'package:flutter_lab2/models/mocks/Post.mock.dart';

class Feed extends StatelessWidget {
  List<PostModel> posts = POSTS_MOCK;

  List<FeedPreview> getPreviews() {
    return posts.map((PostModel postData) =>
        FeedPreview(postData)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: getPreviews(),
    );
  }
}