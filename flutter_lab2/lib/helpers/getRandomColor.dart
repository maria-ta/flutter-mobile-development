import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lab2/constants/Colors.dart';

Color getRandomColor() {
  int index = 1 + new Random().nextInt(5 - 1);
  switch (index) {
    case 1: {
      return brandColors.champagne;
    }
    case 2: {
      return brandColors.apricot;
    }
    case 3: {
      return brandColors.fuzzy;
    }
    case 4: {
      return brandColors.mulberry;
    }
    case 5: {
      return brandColors.purpureus;
    }
    return brandColors.background;
  }
}