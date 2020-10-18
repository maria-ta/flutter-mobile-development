import 'package:flutter_lab2/models/PostModel.dart';
import 'package:flutter_lab2/state/store/UserStore.dart';

class AppStore {
  List<PostModel> posts;
  UserStore userStore;

  AppStore(this.posts, this.userStore);
}