import 'package:flutter/cupertino.dart';
import 'package:flutter_lab2/components/posts/PostBody.dart';
import 'package:flutter_lab2/components/posts/PostFooter.dart';
import 'package:flutter_lab2/components/posts/PostHeader.dart';
import 'package:flutter_lab2/models/PostModel.dart';
import 'package:flutter_lab2/models/UserModel.dart';
import 'package:flutter_lab2/state/store/AppStore.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Post extends StatelessWidget {
  PostModel post;

  Post(this.post);

  Widget getPostWidget(UserModel currentUser) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        children: [
          PostHeader(post.author),
          PostBody(post.imageSrcs),
          PostFooter(post, currentUser),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppStore, AppStore>(
      converter: (store) => store.state,
      builder: (context, store) {
        return getPostWidget(store.userStore.currentUser);
      },
    );
  }
}