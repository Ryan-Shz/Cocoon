import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/common_model.dart';

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
        children: _createItems(_navList),
      ),
    );
  }

  List<Widget> _createItems(List<CommonModel> navList) {
    return navList
        .map(
          (e) => Padding(
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
        )
        .toList();
  }
}
