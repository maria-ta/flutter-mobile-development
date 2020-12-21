import 'package:flutter/material.dart';
import 'package:flutter_lab2/constants/Colors.dart';

import 'ColoredBlock.dart';

class LengthAnimatedBlock extends StatefulWidget {
  _LengthAnimatedBlock createState() => _LengthAnimatedBlock();
}

class _LengthAnimatedBlock extends State<LengthAnimatedBlock> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 4), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
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
        color: BrandColors.fuzzy,
        width: animation.value,
        height: 30
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}