import 'package:flutter/material.dart';
import 'package:flutter_app/app/widget/loading.dart';

class LoadingContainer extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  LoadingContainer({this.isLoading = true, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading ? LoadingWidget() : child,
    );
  }
}
