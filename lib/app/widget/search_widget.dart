import 'package:flutter/material.dart';
import 'package:flutter_app/app/dao/search_dao.dart';
import 'package:flutter_app/app/model/search_model.dart';
import 'package:flutter_app/app/utils/RouteUtils.dart';
import 'package:flutter_app/app/utils/statusbar_utils.dart';
import 'package:flutter_app/app/utils/toast_utils.dart';

import '../model/search_model.dart';
import 'webview_widget.dart';

const String HINT = '网红打卡地 景点 酒店 美食';
const TYPES = [
  'channelgroup',
  'gs',
  'plane',
  'train',
  'cruise',
  'district',
  'food',
  'hotel',
  'huodong',
  'shop',
  'sight',
  'ticket',
  'travelgroup'
];

class HomeSearchPage extends StatefulWidget {
  final String searchUrl;
  final bool hasBackBtn;

  HomeSearchPage({@required this.searchUrl, this.hasBackBtn = true});

  @override
  _HomeSearchPageState createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  TextEditingController _controller;
  SearchModel _searchModel;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // 防止界面弹出键盘时向上顶起布局
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfff2f2f2),
        body: Container(
          margin:
              EdgeInsets.only(top: StatusBarUtils.getStatusBarHeight(context)),
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Offstage(
                      offstage: !widget.hasBackBtn,
                      child: FractionallySizedBox(
                        heightFactor: 1,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 8),
                              child: Icon(Icons.arrow_back_ios),
                            )),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 30,
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                          color: Color(int.parse('0xffEDEDED')),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: TextField(
                        onChanged: _onTextChanged,
                        controller: _controller,
                        focusNode: _focusNode,
                        decoration: InputDecoration(
                            hintText: HINT,
                            contentPadding: EdgeInsets.only(bottom: 10),
                            prefixIcon: Icon(Icons.search, color: Colors.blue),
                            suffixIcon: Icon(
                              Icons.keyboard_voice,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                        autofocus: true,
                      ),
                    )),
                    FractionallySizedBox(
                      heightFactor: 1,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            _search(_controller.text);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              '搜索',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              _searchList()
            ],
          ),
        ),
      ),
    );
  }

  _searchList() {
    return _hasSearchResult()
        ? Expanded(
            child: Container(
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  itemCount: _searchModel.data.length,
                  itemBuilder: (context, index) =>
                      _createSearchItem(context, index),
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                )),
          ))
        : Container();
  }

  bool _hasSearchResult() {
    return _searchModel != null && _searchModel.data != null;
  }

  Widget _createSearchItem(BuildContext context, int index) {
    SearchItem item = _searchModel.data[index];
    String type = item.type;
    String title = item.word;
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
        RouteUtils.open(
            context,
            WebViewWidget(
              url: item.url,
            ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Image(
                    height: 26,
                    width: 26,
                    image: AssetImage(_getAssetPath(type))),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  void _onTextChanged(String value) {
    _search(value);
  }

  void _search(String keyword) async {
    SearchModel model = await SearchDao.fetch(widget.searchUrl + keyword);
    setState(() {
      _searchModel = model;
    });
  }

  String _getAssetPath(String type) {
    String path = 'travelgroup';
    for (final val in TYPES) {
      if (type.contains(val)) {
        path = val;
        break;
      }
    }
    return 'images/type_$path.png';
  }
}
