import 'package:flutter/cupertino.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'package:flutter_lab2/constants/Colors.dart';
import 'package:provider/provider.dart';

LinearGradient standartGradient = LinearGradient(
  colors: [
    BrandColors.apricot,
    BrandColors.fuzzy,
    BrandColors.mulberry,
  ],
  begin: Alignment(0.0, -1.0),
  end: Alignment(0.0, 1.0),
);

LinearGradient getStandartGradient(context) {
  final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
  return LinearGradient(
    colors: [
      appStyleMode.apricot,
      appStyleMode.fuzzy,
      appStyleMode.mulberry,
    ],
    begin: Alignment(0.0, -1.0),
    end: Alignment(0.0, 1.0),
  );
}