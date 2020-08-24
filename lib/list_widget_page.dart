import 'package:flutter/material.dart';

var _cities = [
  '福建',
  '上海',
  '北京',
  '浙江',
  '天津',
  '台湾',
  '香港',
  '澳门',
  '山东',
  '山西',
  '湖北'
];

class ListWidgetPage extends StatefulWidget {
  @override
  _ListWidgetPageState createState() => _ListWidgetPageState();
}

class _ListWidgetPageState extends State<ListWidgetPage> {

  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('列表组件示例'),
        ),
        body: RefreshIndicator( // 下拉刷新实现
          child: ListView.builder(
            itemCount: _cities.length,
            itemBuilder: (context, index) {
              return _createItem(_cities[index]);
            },
            controller: _controller,
          ),
          onRefresh: _handleRefresh,
        ),
      ),
    );
  }

  List<Widget> buildList() {
    return _cities.map((city) => _createItem(city)).toList();
  }

  Widget _createItem(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _cities = _cities.reversed.toList();
    });
    return null;
  }

  _loadMore() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      List<String> newList = List<String>.from(_cities);
      newList.addAll(_cities);
      _cities = newList;
    });
  }
}
