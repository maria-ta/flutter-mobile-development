import 'package:flutter_lab2/models/UserModel.dart';

class CreateUserAction {
  final UserModel user;

  CreateUserAction(this.user);
}

class SetCurrentUserAction {
  final UserModel user;

  SetCurrentUserAction(this.user);
}

class UnsetCurrentUserAction {

}