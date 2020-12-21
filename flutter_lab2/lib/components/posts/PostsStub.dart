import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/components/posts/PostsFeed.dart';
import 'package:flutter_lab2/models/PostModel.dart';
import 'package:flutter_lab2/services/PlaceholderService.dart';

class PostsStub extends StatefulWidget {
  _PostsStub createState() => _PostsStub();
}

class _PostsStub extends State<PostsStub> with SingleTickerProviderStateMixin {
  List<PostModel> posts = [];

  @override
  void initState() {
    super.initState();
    PlaceholderService.getPosts()
    .then((posts) {
      setState(() {
        this.posts = posts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        PostsFeed(this.posts),
      ],
    );
  }
}