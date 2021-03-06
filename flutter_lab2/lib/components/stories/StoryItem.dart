import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'package:flutter_lab2/components/shared/CircleAvatarFramed.dart';
import 'package:flutter_lab2/constants/Colors.dart';
import 'package:provider/provider.dart';

class StoryItem extends StatelessWidget {
  final String previewSrc;
  final String username;

  StoryItem(this.previewSrc, this.username);

  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatarFramed(previewSrc, true),
        Container(
          child: Text(
              username,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: appStyleMode.text
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        )
      ],
    );
  }
}