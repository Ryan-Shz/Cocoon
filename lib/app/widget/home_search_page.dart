import 'package:flutter/material.dart';
import 'package:flutter_app/app/dao/search_dao.dart';
import 'package:flutter_app/app/model/search_model.dart';
import 'package:flutter_app/app/utils/statusbar_utils.dart';

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

  HomeSearchPage(this.searchUrl);

  @override
  _HomeSearchPageState createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  TextEditingController _controller;
  SearchModel _searchModel;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: Container(
          margin:
              EdgeInsets.only(top: StatusBarUtils.getStatusBarHeight(context)),
          child: Stack(
            children: <Widget>[
              Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FractionallySizedBox(
                      heightFactor: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          color: Color(int.parse('0xffEDEDED')),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: TextField(
                        onChanged: _onTextChanged,
                        controller: _controller,
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            '搜索',
                            style: TextStyle(fontSize: 16, color: Colors.blue),
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
        ? Container(
            margin: EdgeInsets.only(top: 50),
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemCount: _searchModel.data.length,
                    itemBuilder: (context, index) =>
                        _createSearchItem(context, index))),
          )
        : Container();
  }

  bool _hasSearchResult() {
    return _searchModel != null && _searchModel.data != null;
  }

  Widget _createSearchItem(BuildContext context, int index) {
    String type = _searchModel.data[index].type;
    String title = _searchModel.data[index].word;
    print(type);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1, color: Colors.grey))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Image(
                height: 26, width: 26, image: AssetImage(_getAssetPath(type))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          )
        ],
      ),
    );
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
