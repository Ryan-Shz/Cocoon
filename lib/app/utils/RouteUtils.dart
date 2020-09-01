import 'package:flutter/material.dart';

class RouteUtils {
  static void open(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  }
}
