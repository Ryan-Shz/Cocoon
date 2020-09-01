import 'package:flutter/material.dart';
import 'package:flutter_app/app/utils/RouteUtils.dart';
import 'package:flutter_app/app/widget/search_widget.dart';
import 'package:flutter_app/app/widget/search_box.dart';

const double APP_BAR_HEIGHT = 50;

class SearchBar extends StatefulWidget {
  final String hint;
  final double alpha;
  final double height;
  final String searchUrl;

  SearchBar({this.hint, this.alpha, this.height, this.searchUrl});

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
    return SearchBox(
      hint: widget.hint,
      backgroundColor: _getSearchBoxBackgroundColor(),
      clickCallback: () {
        RouteUtils.open(context, HomeSearchPage(searchUrl: widget.searchUrl,));
      },
    );
  }

  _getWidgetColor() {
    return widget.alpha > 0.3 ? Colors.brown : Colors.white;
  }

  _getSearchBoxBackgroundColor() {
    return widget.alpha > 0.3 ? Color(int.parse('0xffEDEDED')) : Colors.white;
  }
}
