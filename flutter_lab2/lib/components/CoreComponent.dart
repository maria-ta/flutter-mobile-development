import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/components/AppComponent.dart';
import 'package:flutter_lab2/state/store/AppStore.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CoreComponent extends StatelessWidget {
  final Store<AppStore> store;

  CoreComponent(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppStore>(
      store: store,
      child: AppComponent(),
    );
  }
}