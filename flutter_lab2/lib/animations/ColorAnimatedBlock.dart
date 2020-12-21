

import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/constants/Colors.dart';

import 'ColoredBlock.dart';

class ColorAnimatedBlock extends StatefulWidget {
  ColorAnimatedBlock({Key key}) : super(key: key);

  @override
  _ColorAnimatedBlockState createState() => _ColorAnimatedBlockState();
}

class _ColorAnimatedBlockState extends State<ColorAnimatedBlock> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Color> background;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    background = TweenSequence<Color>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: BrandColors.apricot,
          end: BrandColors.fuzzy,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: BrandColors.fuzzy,
          end: BrandColors.mulberry,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: BrandColors.mulberry,
          end: BrandColors.purpureus,
        ),
      ),
    ]).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
    ;

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBlock.custom(
        color: background.value,
        width: 150,
        height: 30
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}