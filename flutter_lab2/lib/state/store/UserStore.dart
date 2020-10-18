import 'package:flutter_lab2/models/UserModel.dart';

class UserStore {
  List<UserModel> users;

  UserModel currentUser;

  UserStore(this.users, this.currentUser);
}