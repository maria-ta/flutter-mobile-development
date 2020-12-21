import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/components/posts/Post.dart';
import 'package:flutter_lab2/models/PostModel.dart';
import 'package:flutter_lab2/models/mocks/Post.mock.dart';

class PostsFeed extends StatelessWidget {
  List<PostModel> posts;

  PostsFeed(this.posts);

  List<Post> getPostItems() {
    return posts.map((PostModel postData) =>
        Post(postData)).toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: getPostItems(),
    );
  }
}