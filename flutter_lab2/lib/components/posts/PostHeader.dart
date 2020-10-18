import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab2/models/UserModel.dart';

class PostHeader extends StatelessWidget {
  final UserModel user;

  PostHeader(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(user.avatar),
                  ),
                  Container(
                    child: Text(
                      user.username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  )
                ]
            ),
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black12,
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