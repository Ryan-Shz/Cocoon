import 'package:flutter/material.dart';
import 'dart:math' as math;

class StatusBarUtils {
  static double getStatusBarHeight(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    double top = math.max(padding.top, EdgeInsets.zero.top);
    return top;
  }
}