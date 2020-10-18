import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab2/constants/Colors.dart';

class CircleAvatarFramed extends StatelessWidget {
  String previewSrc;
  bool isFramed;

  double size = 32;
  double delta = 2;

  Color frameColor = brandColors.fuzzy;

  CircleAvatarFramed(this.previewSrc, this.isFramed);

  CircleAvatarFramed.custom({
    this.previewSrc,
    this.isFramed,
    this.size,
    this.delta
  });


  CircleAvatar getFramedAvatar() {
    return CircleAvatar(
      radius: size,
      backgroundColor: frameColor,
      child: CircleAvatar(
        radius: size - delta,
        backgroundColor: brandColors.background,
        child: CircleAvatar(
          radius: size - delta * 2,
          backgroundImage: NetworkImage(previewSrc),
          backgroundColor: brandColors.mulberry,
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
    return isFramed ? this.getFramedAvatar() : this.getAvatar();
  }
}