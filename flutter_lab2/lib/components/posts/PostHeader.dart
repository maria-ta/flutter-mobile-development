import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'package:flutter_lab2/components/shared/CircleAvatarFramed.dart';
import 'package:flutter_lab2/models/UserModel.dart';
import 'package:provider/provider.dart';

class PostHeader extends StatelessWidget {
  final UserModel user;

  PostHeader(this.user);

  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children: [
                  CircleAvatarFramed
                      .custom(previewSrc: user.avatar, isFramed: false, size: 20, delta: 2),
                  Container(
                    child: Text(
                      user.username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appStyleMode.text
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  )
                ]
            ),
            IconButton(
              icon: Icon(
                Icons.menu,
                color: appStyleMode.shadedText,
                size: 24.0,
                semanticLabel: 'Go to direct messages',
              ),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        )
    );
  }

}