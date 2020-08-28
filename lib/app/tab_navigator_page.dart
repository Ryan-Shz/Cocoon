import 'package:flutter/material.dart';
import 'package:flutter_app/app/home_page.dart';
import 'package:flutter_app/app/my_page.dart';
import 'package:flutter_app/app/search_page.dart';
import 'package:flutter_app/app/travel_page.dart';

class TabNavigatorPage extends StatefulWidget {
  @override
  _TabNavigatorPageState createState() => _TabNavigatorPageState();
}

class _TabNavigatorPageState extends State<TabNavigatorPage> {
  int _currIndex = 0;
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "首页导航框架",
      home: Scaffold(
          backgroundColor: Color(0xfff2f2f2),
          body: PageView(
            controller: _controller,
            children: <Widget>[
              HomePage(),
              SearchPage(),
              TravelPage(),
              MyPage()
            ],
            onPageChanged: (index) {
              setState(() {
                _currIndex = index;
              });
            },
            // 让PageView无法左右滚动
            physics: NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currIndex,
              // 让items水平等分
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  _currIndex = index;
                  _controller.jumpToPage(_currIndex);
                });
              },
              items: [
                createTab(0, Icons.home, '首页'),
                createTab(1, Icons.search, '搜索'),
                createTab(2, Icons.camera_alt, '旅拍'),
                createTab(3, Icons.account_circle, '我的'),
              ])),
    );
  }

  createTab(int index, icon, String text) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: Colors.grey,
      ),
      activeIcon: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Text(
        text,
        style:
            TextStyle(color: _currIndex == index ? Colors.blue : Colors.grey),
      ),
    );
  }
}
