import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return AppBar(
      leading: Icon(
        Icons.photo_camera,
        color: appStyleMode.text,
        size: 24.0,
        semanticLabel: 'Logo',
      ),
      title: Text(
        'Hello App',
        style: TextStyle(
          color: appStyleMode.text,
          fontSize: 25,
        ),
      ),
      actions: [
        Icon(
          Icons.send,
          color: appStyleMode.text,
          size: 24.0,
          semanticLabel: 'Go to direct messages',
        )
      ],
      centerTitle: true,
      backgroundColor: appStyleMode.background,
    );
  }
}