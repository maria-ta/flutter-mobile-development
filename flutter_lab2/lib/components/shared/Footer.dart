import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 50.0,
        child: Material(
          color: appStyleMode.background,
          child: TabBar(
            indicatorColor: appStyleMode.fuzzy,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  color: appStyleMode.text,
                ),
              ),
              Tab(
                  icon: Icon(
                    Icons.search,
                    color: appStyleMode.text,
                  )
              ),
              Tab(
                  icon: Icon(
                    Icons.favorite,
                    color: appStyleMode.text,
                  )
              ),
              Tab(
                  icon: Icon(
                    Icons.perm_identity,
                    color: appStyleMode.text,
                  )
              ),
            ],
          )
        )
      ),
    );
  }
}