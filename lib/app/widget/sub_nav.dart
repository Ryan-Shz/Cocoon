import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/common_model.dart';
import 'package:flutter_app/app/widget/webview_widget.dart';

class SubNavList extends StatelessWidget {
  final List<CommonModel> subNavList;

  SubNavList({this.subNavList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 6, right: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Column(
          children: _createItems(context),
        ),
      ),
    );
  }

  List<Widget> _createItems(BuildContext context) {
    int length = subNavList.length;
    int rows = length ~/ 2;
    int remain = length % 2;

    List<Widget> items = [];
    items.add(_item(context, subNavList.sublist(0, rows + remain)));
    items.add(_item(context, subNavList.sublist(rows + remain)));
    return items;
  }

  Widget _item(BuildContext context, List<CommonModel> models) {
    List<Widget> widgets = models
        .map((e) => Expanded(
              child: _wrapGesture(context, e, Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Column(
                  children: <Widget>[
                    Image.network(
                      e.icon,
                      width: 18,
                      height: 18,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        e.title,
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              )),
            ))
        .toList();
    return Row(
      children: widgets,
    );
  }

  _wrapGesture(BuildContext context, CommonModel model, Widget child) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewWidget(
                      url: model.url,
                    )));
      },
      child: child,
    );
  }
}
