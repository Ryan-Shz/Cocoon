import 'package:flutter/material.dart';

class ColorUtils {
  static Color hexToColor(String code) {
    return Color(int.parse('0xff' + code));
  }
}