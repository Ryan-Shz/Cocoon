import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/common_model.dart';
import 'package:flutter_app/app/widget/webview_widget.dart';

// 首页顶部球区入口组件
class GridNavItem extends StatelessWidget {
  final List<CommonModel> _navList;

  GridNavItem(this._navList);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _createItems(context, _navList),
      ),
    );
  }

  List<Widget> _createItems(BuildContext context, List<CommonModel> navList) {
    if (navList == null) {
      return null;
    }
    return navList
        .map(
          (e) => GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebViewWidget(
                            statusBarColor: e.statusBarColor??'1070b8',
                            url: e.url,
                            hideAppBar: e.hideAppBar,
                          )));
            },
            child: Padding(
              padding: EdgeInsets.all(7),
              child: Column(
                children: <Widget>[
                  Image.network(
                    e.icon,
                    width: 32,
                    height: 32,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Text(
                      e.title,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
        .toList();
  }
}
