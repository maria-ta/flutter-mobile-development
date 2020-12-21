import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/constants/Colors.dart';

import 'ColoredBlock.dart';

class StatelessStaggerAnimatedBlock extends StatelessWidget {
  final AnimationController controller;

  Animation<double> width;
  Animation<double> height;

  StatelessStaggerAnimatedBlock({ Key key, this.controller }) {
    width = Tween<double>(
      begin: 10.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.125, 0.250,
          curve: Curves.ease,
        ),
      ),
    );

    height = Tween<double>(
      begin: 10.0,
      end: 200.0
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.250, 0.375,
          curve: Curves.ease,
        )
      )
    );
  }
  Widget _buildAnimation(BuildContext context, Widget child) {
    return ColoredBlock.custom(
        color: BrandColors.mulberry,
        width: width.value,
        height: height.value
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class StaggerAnimatedBlock extends StatefulWidget {
  @override
  _StaggerAnimatedBlockState createState() => _StaggerAnimatedBlockState();
}

class _StaggerAnimatedBlockState extends State<StaggerAnimatedBlock> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(seconds: 10),
        vsync: this
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return StatelessStaggerAnimatedBlock(
        controller: controller.view
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
