import 'package:flutter_lab2/helpers/getUniqueId.dart';
import 'package:flutter_lab2/models/mocks/Images.mock.dart';
import 'package:flutter_lab2/models/mocks/User.mock.dart';

import 'UserModel.dart';

class PostModel {
  String id;
  String description = '';
  UserModel author;
  List<String> imageSrcs;
  List<UserModel> likes;

  PostModel(this.id, this.author, this.imageSrcs, this.description, this.likes);

  PostModel.createPost(UserModel currentUser, String image, String description) {
    id = getUniqueId();
    author = currentUser;
    imageSrcs = [image];
    this.description = description;
    likes = [];
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        json['id'].toString(),
        USER_MOCK,
        [IMAGE_SRC],
        json['body'].toString(),
        []
    );
  }
}