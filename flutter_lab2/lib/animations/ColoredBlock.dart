import 'package:flutter/widgets.dart';

class ColoredBlock extends StatelessWidget {
  Color color;
  double width = 0;
  double height = 0;

  ColoredBlock.custom({
    this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color
        ),
      )
    );
  }

}