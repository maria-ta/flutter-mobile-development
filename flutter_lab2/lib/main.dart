import 'package:flutter/material.dart';
import 'package:flutter_lab2/components/CoreComponent.dart';
import 'package:flutter_lab2/state/InitialState.dart';
import 'package:flutter_lab2/state/reducers/App.reducers.dart';
import 'package:flutter_lab2/state/store/AppStore.dart';
import 'package:redux/redux.dart';

void main() {
  final store = new Store<AppStore>(
      appReducers,
      initialState: initialState
  );

  runApp(new CoreComponent(store));
}


