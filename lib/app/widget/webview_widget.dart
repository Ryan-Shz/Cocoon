import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/app/utils/color_utils.dart';
import 'package:flutter_app/app/utils/statusbar_utils.dart';
import 'package:flutter_app/app/widget/loading.dart';
import 'package:webview_flutter/webview_flutter.dart';

const BACK_URLS = [
  'https://m.ctrip.com/html5/',
//  'https://m.ctrip.com/webapp/you/'
];

class WebViewWidget extends StatefulWidget {
  final String statusBarColor;
  final String url;
  final bool hideAppBar;
  final bool forbiddenBack;

  WebViewWidget(
      {this.statusBarColor = "1070b8",
      @required this.url,
      this.hideAppBar = true,
      this.forbiddenBack = false});

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViewWidget> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isPageLoadFinished = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: <Widget>[
          createAppBar(ColorUtils.hexToColor(widget.statusBarColor)),
          Expanded(
              child: Stack(
            children: <Widget>[_createWebView(), _createLoading()],
          ))
        ],
      )),
    );
  }

  _createWebView() {
    return Opacity(
      opacity: isPageLoadFinished ? 1 : 0,
      child: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        navigationDelegate: (NavigationRequest request) {
          print(request.url);
          // 拦截返回到首页逻辑，类似android WebView的shouldOverrideUrlLoading
          if (!widget.forbiddenBack) {
            for (var url in BACK_URLS) {
              if (request.url.startsWith(url)) {
                Navigator.pop(context);
                print('blocking navigation to $request}');
                return NavigationDecision.prevent;
              }
            }
          }
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
          _markLoadState(true);
        },
        gestureNavigationEnabled: true,
      ),
    );
  }

  _createLoading() {
    return isPageLoadFinished ? Container() : LoadingWidget();
  }

  _markLoadState(bool isCompleted) {
    Future.delayed(Duration(microseconds: 200), () {
      setState(() {
        isPageLoadFinished = isCompleted;
      });
    });
  }

  _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  Widget createAppBar(Color backgroundColor) {
    return Container(
      height: StatusBarUtils.getStatusBarHeight(context),
      decoration: BoxDecoration(color: backgroundColor),
    );
  }
}
