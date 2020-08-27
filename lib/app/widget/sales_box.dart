import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/common_model.dart';
import 'package:flutter_app/app/model/sales_box_model.dart';
import 'package:flutter_app/app/widget/webview_widget.dart';

class SalesBox extends StatelessWidget {
  final SalesBoxModel model;

  SalesBox(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(top: 5, left: 6, right: 6, bottom: 6),
      child: Column(
        children: <Widget>[
          _hotEventsItem(context),
          _doubleItems(context, model.bigCard1, model.bigCard2, true),
          _doubleItems(context, model.smallCard1, model.smallCard2, false),
          _doubleItems(context, model.smallCard3, model.smallCard4, false),
        ],
      ),
    );
  }

  _hotEventsItem(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.network(
            model.icon,
            height: 15,
          ),
          GestureDetector(
            onTap: (){
              _openWeb(context, model.moreUrl);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  gradient: LinearGradient(colors: [
                    Color(0xffff4e63),
                    Color(0xffff6cc9),
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text('获取更多福利 >',
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
          )
        ],
      ),
    );
  }

  _doubleItems(BuildContext context, CommonModel model1, CommonModel model2,
      bool isBigCard) {
    return Row(
      children: <Widget>[
        _item(context, model1, isBigCard, true),
        _item(context, model2, isBigCard, false),
      ],
    );
  }

  _item(BuildContext context, CommonModel model, bool isBigCard, bool isLeft) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Color(0xfff2f2f2));
    return Expanded(
        child: _wrapGesture(
            context,
            model,
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: borderSide,
                      right: isLeft ? borderSide : BorderSide.none)),
              child: Image.network(
                model.icon,
                height: isBigCard ? 129 : 80,
              ),
            )));
  }

  _wrapGesture(BuildContext context, CommonModel model, child) {
    return GestureDetector(
      onTap: () {
        _openWeb(context, model.url);
      },
      child: child,
    );
  }

  _openWeb(BuildContext context, String url) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WebViewWidget(
                  url: url,
                )));
  }
}
