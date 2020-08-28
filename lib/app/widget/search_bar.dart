import 'package:flutter/material.dart';

const double APP_BAR_HEIGHT = 50;

class SearchBar extends StatefulWidget {
  final String hint;
  final double alpha;
  final double height;

  SearchBar({this.hint, this.alpha, this.height});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: widget.alpha,
            child: Container(
              height: widget.height,
              color: Colors.white,
            ),
          ),
          Container(
            height: APP_BAR_HEIGHT,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    '浙江',
                    style: TextStyle(color: _getWidgetColor(), fontSize: 12),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: _getWidgetColor(),
                ),
                Expanded(child: _searchBox()),
                Icon(
                  Icons.comment,
                  color: _getWidgetColor(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _searchBox() {
    return Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 7),
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: _getSearchBoxBackgroundColor()),
      child: GestureDetector(
        onTap: () {

        },
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            Expanded(
              child: Text(
                widget.hint,
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

  _getWidgetColor() {
    return widget.alpha > 0.3 ? Colors.brown : Colors.white;
  }
  
  _getSearchBoxBackgroundColor(){
    return widget.alpha > 0.3 ? Color(int.parse('0xffEDEDED')) : Colors.white;
  }
}
