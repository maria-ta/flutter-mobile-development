import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/animations/ColorAnimatedBlock.dart';
import 'package:flutter_lab2/animations/ColoredBlock.dart';
import 'package:flutter_lab2/animations/HeightAnimatedBlock.dart';
import 'package:flutter_lab2/animations/StaggerAnimatedBlock.dart';
import 'package:flutter_lab2/constants/Colors.dart';

import 'LengthAnimatedBlock.dart';

class AnimatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColoredBlock.custom(
                  color: BrandColors.champagne,
                  width: 150,
                  height: 30
              ),
              ColorAnimatedBlock(),
              LengthAnimatedBlock(),
              StaggerAnimatedBlock(),
              HeightAnimatedBlock(),
            ],
          )
        ],
      ),
    );
  }
}