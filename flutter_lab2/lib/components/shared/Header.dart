import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(
        Icons.photo_camera,
        color: Colors.black,
        size: 24.0,
        semanticLabel: 'Logo',
      ),
      title: Text(
        'Instagram',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
      actions: [
        Icon(
          Icons.send,
          color: Colors.black,
          size: 24.0,
          semanticLabel: 'Go to direct messages',
        )
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}