import 'package:flutter_lab2/models/PostModel.dart';
import 'package:flutter_lab2/models/UserModel.dart';
import 'package:flutter_lab2/models/mocks/Images.mock.dart';
import 'package:flutter_lab2/models/mocks/User.mock.dart';

List<String> imageSrcs = [
  IMAGE_SRC,
  IMAGE_SRC,
];

List<UserModel> users = [
  USER_MOCK,
  USER_MOCK,
  USER_MOCK
];

PostModel POST_MOCK = new PostModel('id-2', USER_MOCK, imageSrcs, 'Hello post!', users);

List<PostModel> POSTS_MOCK = [
  POST_MOCK,
  new PostModel('id-123', USER_MOCK, [IMAGE_SRC_2], 'A very special post!', users),
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK,
  POST_MOCK
];
