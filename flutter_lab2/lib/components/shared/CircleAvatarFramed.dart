import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'package:flutter_lab2/constants/Colors.dart';
import 'package:provider/provider.dart';

class CircleAvatarFramed extends StatelessWidget {
  String previewSrc;
  bool isFramed;

  double size = 32;
  double delta = 2;

  CircleAvatarFramed(this.previewSrc, this.isFramed);

  CircleAvatarFramed.custom({
    this.previewSrc,
    this.isFramed,
    this.size,
    this.delta
  });


  CircleAvatar getFramedAvatar(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return CircleAvatar(
      radius: size,
      backgroundColor: appStyleMode.fuzzy,
      child: CircleAvatar(
        radius: size - delta,
        backgroundColor: appStyleMode.background,
        child: CircleAvatar(
          radius: size - delta * 2,
          backgroundImage: NetworkImage(previewSrc),
          backgroundColor: appStyleMode.mulberry,
        ),
      ),
    );
  }

  CircleAvatar getAvatar() {
    return CircleAvatar(
      radius: size,
      backgroundImage: NetworkImage(previewSrc),
    );
  }

  @override
  Widget build(BuildContext context) {
    // CircleAvatar widget = isFramed ? this.getFramedAvatar() : this.getAvatar();
    return isFramed ? this.getFramedAvatar(context) : this.getAvatar();
  }
}