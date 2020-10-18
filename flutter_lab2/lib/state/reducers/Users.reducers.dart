import 'package:flutter_lab2/state/actions/User.actions.dart';
import 'package:flutter_lab2/state/store/UserStore.dart';

UserStore userReducers(UserStore store, dynamic action) {
  if (action is CreateUserAction) {
    return createUser(store, action);

  } else if (action is SetCurrentUserAction) {
    return setCurrentUser(store, action);

  } else if (action is UnsetCurrentUserAction) {
    return unsetCurrentUser(store, action);

  }
  return store;
}

UserStore createUser(UserStore store, CreateUserAction action) {
  store.users.add(action.user);

  return store;
}

UserStore setCurrentUser(UserStore store, SetCurrentUserAction action) {
  store.currentUser = action.user;

  return store;
}

UserStore unsetCurrentUser(UserStore store, UnsetCurrentUserAction action) {
  store.currentUser = null;

  return store;
}
