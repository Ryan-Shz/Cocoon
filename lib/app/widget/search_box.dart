import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final String hint;
  final Color backgroundColor;
  final Function clickCallback;

  SearchBox({this.hint, this.backgroundColor, this.clickCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 7),
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: backgroundColor),
      child: GestureDetector(
        onTap: () {
          if (this.clickCallback != null) {
            clickCallback.call();
          }
        },
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            Expanded(
              child: Text(
                hint,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Icon(
              Icons.keyboard_voice,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
