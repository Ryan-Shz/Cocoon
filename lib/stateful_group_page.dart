import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class StatefulGroupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StatefulGroupState();
  }
}

class _StatefulGroupState extends State<StatefulGroupPage> {
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StatefulWidget",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatefulWidget'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currIndex,
          onTap: (index) {
            setState(() {
              _currIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.photo,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.photo,
                  color: Colors.blue,
                ),
                title: Text("photo")),
            BottomNavigationBarItem(
                icon: Icon(Icons.android),
                activeIcon: Icon(
                  Icons.android,
                  color: Colors.blue,
                ),
                title: Text("android"))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _currIndex = ++_currIndex % 2;
            });
          },
          child: Icon(Icons.photo),
        ),
        body: _currIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Text("123"),
                    Image.network(
                      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2871418540,755792920&fm=26&gp=0.jpg',
                      width: 100,
                      height: 100,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        hintText: '请输入'
                      ),
                    ),
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.blue
                      ),
                      child: PageView(
                        children: <Widget>[
                          Text("123"),
                          Text("456"),
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: handRefresh)
            : Text("列表"),
      ),
    );
  }

  Future<Null> handRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }
}
