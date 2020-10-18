import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab2/constants/Colors.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 50.0,
        child: TabBar(
          indicatorColor: brandColors.fuzzy,
          tabs: [
            Tab(
                icon: Icon(
                    Icons.home,
                  color: Colors.black,
                ),
            ),
            Tab(
                icon: Icon(
                    Icons.search,
                  color: Colors.black,
                )
            ),
            Tab(
                icon: Icon(
                    Icons.favorite,
                  color: Colors.black,
                )
            ),
            Tab(
                icon: Icon(
                    Icons.perm_identity,
                  color: Colors.black,
                )
            ),
          ],
        ),
      ),
    );
  }
}