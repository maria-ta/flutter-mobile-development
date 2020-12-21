import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'package:flutter_lab2/models/PostModel.dart';
import 'package:flutter_lab2/models/UserModel.dart';
import 'package:flutter_lab2/state/actions/Post.actions.dart';
import 'package:flutter_lab2/state/store/AppStore.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';

typedef OnToggleLikePostCallback = void Function();

class PostFooter extends StatelessWidget {
  PostModel post;
  UserModel currentUser;

  PostFooter(this.post, this.currentUser);

  Widget _getFooterWidget(BuildContext context, OnToggleLikePostCallback callback) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                  width: 300,
                  child: Text(
                      this.post.description ?? 'No description',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appStyleMode.text
                      )
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: _getLikeIcon(appStyleMode),
                    color: appStyleMode.background,
                    onPressed: callback,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.message,
                      color: appStyleMode.text,
                      size: 24.0,
                      semanticLabel: 'Go to direct messages',
                    ),
                    color: appStyleMode.background,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: appStyleMode.text,
                      size: 24.0,
                      semanticLabel: 'Go to direct messages',
                    ),
                    color: appStyleMode.background,
                    onPressed: () {},
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.bookmark_border,
                  color: appStyleMode.text,
                  size: 24.0,
                  semanticLabel: 'Go to direct messages',
                ),
                color: appStyleMode.background,
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
                  color: appStyleMode.text
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
          return _getFooterWidget(context, callback);
        });
  }

  Icon _getLikeIcon(AppStyleModeNotifier appStyleMode) {
    return _isLikedByUser() ?
      Icon(
        Icons.favorite,
        color: appStyleMode.fuzzy,
        size: 24.0,
        semanticLabel: 'Liked',
      )
      : Icon(
          Icons.favorite_border,
          color: appStyleMode.text,
          size: 24.0,
          semanticLabel: 'Like',
      );
  }

  bool _isLikedByUser() {
    return post.likes.where((user) => user.id == currentUser.id).length > 0;
  }
}