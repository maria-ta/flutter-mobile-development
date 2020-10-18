import 'package:flutter_lab2/helpers/getUniqueId.dart';

import 'UserModel.dart';

class PostModel {
  String id;
  UserModel author;
  List<String> imageSrcs;
  List<UserModel> likes;

  PostModel(this.id, this.author, this.imageSrcs, this.likes);

  PostModel.createPost(UserModel currentUser, String image) {
    id = getUniqueId();
    author = currentUser;
    imageSrcs = [image];
    likes = [];
  }
}