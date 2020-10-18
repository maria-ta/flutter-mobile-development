import 'package:flutter_lab2/models/mocks/User.mock.dart';
import 'package:flutter_lab2/state/store/AppStore.dart';
import 'package:flutter_lab2/state/store/UserStore.dart';

// UserStore initialUserStore = new UserStore([], null);
UserStore initialUserStore = new UserStore([], USER_MOCK);
AppStore initialState = new AppStore([], initialUserStore);