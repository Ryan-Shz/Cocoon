import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class LessGroupPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'StateLessWidget与基础组件',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('StateLessWidget'),
          ),
          body: Container(
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(
                  "I am Test",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(ColorUtil.RED),
                  ),
                ),
                Icon(
                  Icons.android,
                  size: 50,
                  color: Colors.green,
                ),
                CloseButton(),
                BackButton(),
                Chip(
                    avatar: Icon(Icons.photo),
                    label: Text("StateLessWidget与基础组件")),
                Divider(
                  color: Colors.blue,
                  height: 50,
                  indent: 20,
                ),
                Card(
                  color: Colors.orange,
                  elevation: 5, // 阴影
                  margin: EdgeInsets.only(top: 10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text("I am card"),
                  ),
                ),
                AlertDialog(
                  title: Text('标题'),
                  content: Text('内容'),
                ),
              ],
            ),
          ),
        ));
  }
}
