import 'package:flutter_lab2/models/PostModel.dart';
import 'package:flutter_lab2/models/UserModel.dart';

class AddPostAction {
  final PostModel post;

  AddPostAction(this.post);
}

class ToggleLikePostAction {
  final PostModel post;
  final UserModel user;

  ToggleLikePostAction(this.post, this.user);
}
