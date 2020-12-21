import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lab2/constants/Colors.dart';

Color getRandomColor() {
  int index = 1 + new Random().nextInt(5 - 1);
  switch (index) {
    case 1: {
      return BrandColors.champagne;
    }
    case 2: {
      return BrandColors.apricot;
    }
    case 3: {
      return BrandColors.fuzzy;
    }
    case 4: {
      return BrandColors.mulberry;
    }
    case 5: {
      return BrandColors.purpureus;
    }
    return BrandColors.background;
  }
}