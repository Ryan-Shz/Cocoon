import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/sales_box_model.dart';

class SalesBox extends StatelessWidget {
  final SalesBoxModel model;

  SalesBox(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          _hotEventsItem(context),
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
          Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(6)),
                gradient: LinearGradient(colors: [
                  Color(0xffff4e63),
                  Color(0xffff6cc9),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Text('获取更多福利 >',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          )
        ],
      ),
    );
  }

//  _doubleBigCard(BuildContext context) {
//    return
//  }
}
