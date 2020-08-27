import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/common_model.dart';
import 'package:flutter_app/app/model/grid_nav_model.dart';
import 'package:flutter_app/app/utils/color_utils.dart';
import 'package:flutter_app/app/widget/webview_widget.dart';

const DEFAULT_STATUS_BAR_COLOR = '1070b8';

class HomeGridItem extends StatelessWidget {
  final bool topRadius;
  final bool bottomRadius;
  final NavModel model;
  final Color _startColor;
  final Color _endColor;
  final double marginTop;

  HomeGridItem(
      {this.model,
      this.topRadius = false,
      this.bottomRadius = false,
      this.marginTop = 3})
      : _startColor = ColorUtils.hexToColor(model.startColor),
        _endColor = ColorUtils.hexToColor(model.endColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      margin: EdgeInsets.only(top: marginTop),
      decoration: BoxDecoration(
        borderRadius: getBorderRadius(),
        gradient: LinearGradient(colors: [_startColor, _endColor]),
      ),
      child: Row(
        children: _createItems(context),
      ),
    );
  }

  List<Widget> _createItems(BuildContext context) {
    List<Widget> items = [];
    items.add(_createMainItem(context));
    items.add(_createDoubleItem(context, model.item1, model.item2));
    items.add(_createDoubleItem(context, model.item3, model.item4));
    return items;
  }

  _createMainItem(BuildContext context) {
    return Expanded(
        child: _wrapGesture(
            context,
            model.mainItem,
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                Image.network(
                  model.mainItem.icon,
                  fit: BoxFit.contain,
                  height: 88,
                  width: 121,
                  alignment: AlignmentDirectional.bottomEnd,
                ),
                Container(
                  margin: EdgeInsets.only(top: 11),
                  child: Text(
                    model.mainItem.title,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                )
              ],
            )));
  }

  _createDoubleItem(
      BuildContext context, CommonModel model1, CommonModel model2) {
    return Expanded(
        child: Column(
      children: <Widget>[
        Expanded(child: _createTitleItem(context, model1, true)),
        Expanded(child: _createTitleItem(context, model2, false)),
      ],
    ));
  }

  _createTitleItem(BuildContext context, CommonModel model, bool isTop) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);
    return _wrapGesture(
        context,
        model,
        FractionallySizedBox(
          //撑满父布局的宽度
          child: Container(
            decoration: BoxDecoration(
                border: Border(
              left: borderSide,
              bottom: isTop ? borderSide : BorderSide.none,
            )),
            child: Center(
              child: Text(
                model.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ));
  }

  getBorderRadius() {
    Radius radius = Radius.circular(6);
    return BorderRadius.only(
        topLeft: topRadius ? radius : Radius.zero,
        topRight: topRadius ? radius : Radius.zero,
        bottomLeft: bottomRadius ? radius : Radius.zero,
        bottomRight: bottomRadius ? radius : Radius.zero);
  }

  _wrapGesture(BuildContext context, CommonModel model, Widget child) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewWidget(
                      url: model.url,
                      statusBarColor:
                          model.statusBarColor ?? DEFAULT_STATUS_BAR_COLOR,
                      hideAppBar: model.hideAppBar,
                    )));
      },
      child: child,
    );
  }
}
