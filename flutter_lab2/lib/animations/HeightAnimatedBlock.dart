import 'package:flutter/material.dart';
import 'package:flutter_lab2/constants/Colors.dart';

import 'ColoredBlock.dart';

class HeightAnimatedBlock extends StatefulWidget {
  _HeightAnimatedBlock createState() => _HeightAnimatedBlock();
}

class _HeightAnimatedBlock extends State<HeightAnimatedBlock> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 50).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBlock.custom(
        color: BrandColors.purpureus,
        width: 150,
        height: animation.value
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}