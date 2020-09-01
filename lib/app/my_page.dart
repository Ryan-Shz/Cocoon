import 'package:flutter/material.dart';
import 'package:flutter_app/app/widget/webview_widget.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        url: 'https://m.ctrip.com/webapp/myctrip/',
        forbiddenBack: true,
      ),
    );
  }
}
