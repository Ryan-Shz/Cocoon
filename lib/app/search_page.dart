import 'package:flutter/material.dart';
import 'package:flutter_app/app/global/Global.dart';
import 'package:flutter_app/app/widget/search_widget.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return HomeSearchPage(
      searchUrl: Global.HOME_MODEL.config.searchUrl,
      hasBackBtn: false,
    );
  }
}
