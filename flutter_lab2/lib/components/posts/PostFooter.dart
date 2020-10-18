import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/constants/Colors.dart';
import 'package:flutter_lab2/models/PostModel.dart';
import 'package:flutter_lab2/models/UserModel.dart';
import 'package:flutter_lab2/state/actions/Post.actions.dart';
import 'package:flutter_lab2/state/store/AppStore.dart';
import 'package:flutter_redux/flutter_redux.dart';

typedef OnToggleLikePostCallback = void Function();

class PostFooter extends StatelessWidget {
  PostModel post;
  UserModel currentUser;

  PostFooter(this.post, this.currentUser);

  Widget _getFooterWidget(OnToggleLikePostCallback callback) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: _getLikeIcon(),
                    color: Colors.white,
                    onPressed: callback,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.message,
                      color: Colors.black,
                      size: 24.0,
                      semanticLabel: 'Go to direct messages',
                    ),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.black,
                      size: 24.0,
                      semanticLabel: 'Go to direct messages',
                    ),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.bookmark_border,
                  color: Colors.black,
                  size: 24.0,
                  semanticLabel: 'Go to direct messages',
                ),
                color: Colors.white,
                onPressed: () {},
              )
            ],
          ),
          Row(
            children: [
              Text(
                post.likes.length.toString() + ' likes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppStore, OnToggleLikePostCallback>(
        converter: (store) {
          UserModel currentUser = store.state.userStore.currentUser;
          return () =>
              store.dispatch(ToggleLikePostAction(post, currentUser));
        },
        builder: (context, callback) {
          return _getFooterWidget(callback);
        });
  }

  Icon _getLikeIcon() {
    return _isLikedByUser() ?
      Icon(
        Icons.favorite,
        color: brandColors.fuzzy,
        size: 24.0,
        semanticLabel: 'Liked',
      )
      : Icon(
          Icons.favorite_border,
          color: brandColors.text,
          size: 24.0,
          semanticLabel: 'Like',
      );
  }

  bool _isLikedByUser() {
    return post.likes.where((user) => user.id == currentUser.id).length > 0;
  }
}