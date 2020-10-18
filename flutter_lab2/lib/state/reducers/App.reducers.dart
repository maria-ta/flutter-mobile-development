import 'package:flutter_lab2/state/actions/Post.actions.dart';
import 'package:flutter_lab2/state/actions/User.actions.dart';
import 'package:flutter_lab2/state/reducers/Post.reducers.dart';
import 'package:flutter_lab2/state/reducers/Users.reducers.dart';
import 'package:flutter_lab2/state/store/AppStore.dart';

AppStore appReducers(AppStore store, dynamic action) {
  if (isPostAction(action)) {
    store.posts = postReducers(store.posts, action);
  } else if (isUserAction(action)) {
    store.userStore = userReducers(store.userStore, action);
  }
  return store;
}

bool isPostAction(dynamic action) {
  return action is AddPostAction || action is ToggleLikePostAction;
}

bool isUserAction(dynamic action) {
  return action is CreateUserAction
      || action is SetCurrentUserAction
      || action is UnsetCurrentUserAction;
}
