import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'package:flutter_lab2/components/posts/Post.dart';
import 'package:flutter_lab2/models/PostModel.dart';
import 'package:flutter_lab2/models/mocks/Post.mock.dart';
import 'package:provider/provider.dart';

class PostPageArguments {
  final String id;

  PostPageArguments(this.id);
}

class PostPage extends StatelessWidget {
  PostModel post;

  _getPost(BuildContext context) {
    if (post == null) {
      final PostPageArguments args = ModalRoute.of(context).settings.arguments;
      this.post = POSTS_MOCK.where((element) => element.id == args.id).first;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    _getPost(context);

    return Scaffold(
      backgroundColor: appStyleMode.background,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Post(post),
        ],
      ),
    );
  }
}