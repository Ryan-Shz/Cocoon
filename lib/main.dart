import 'package:flutter/material.dart';
import 'package:flutter_app/dart/oop.dart';
import 'package:flutter_app/gesture_page.dart';
import 'package:flutter_app/layout_page.dart';
import 'package:flutter_app/less_group_page.dart';
import 'package:flutter_app/list_widget_page.dart';
import 'package:flutter_app/dart/operator.dart';
import 'package:flutter_app/plugin.dart';
import 'package:flutter_app/resource_page.dart';
import 'package:flutter_app/stateful_group_page.dart';
import 'package:flutter_app/app/tab_navigator_page.dart';
import 'package:flutter_app/widget_lifecycle_page.dart';

void main() {
//  runApp(LessGroupPage());
//  runApp(StatefulGroupPage());
//  runApp(LayoutPage());
  runApp(MyApp());
  
  Operator operator = Operator();
  operator.test();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RouterNavigator(title: 'Flutter Demo Home Page'),
      // 注册路由, 可以通过Navigator.pushNamed(context, routeName);来跳转
      routes: <String, WidgetBuilder>{
        'less': (context) => LessGroupPage(),
        'ful': (context) => StatefulGroupPage(),
        'layout': (context) => LayoutPage(),
        'plugin': (context) => PluginUse(),
        'gesture': (context) => GesturePage(),
        'resource': (context) => ResourcePage(),
        'lifecycle': (context) => WidgetLifecyclePage(),
        'tab': (context) => TabNavigatorPage(),
        'list': (context) => ListWidgetPage(),
      },
    );
  }
}

class RouterNavigator extends StatefulWidget {
  RouterNavigator({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _RouterNavigatorState createState() => _RouterNavigatorState();
}

class _RouterNavigatorState extends State<RouterNavigator> {
  bool _byName = false;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    _oopLearn();
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SwitchListTile(
                title: Text('${_byName ? '' : '不'}通过路由名称跳转'),
                value: _byName,
                onChanged: (value) {
                  setState(() {
                    _byName = value;
                  });
                }),
            _createButton('LessFulWidget', LessGroupPage(), 'less'),
            _createButton('StatefulWidget', StatefulGroupPage(), 'ful'),
            _createButton('LayoutPage', LayoutPage(), 'layout'),
            _createButton('PluginPage', PluginUse(), 'plugin'),
            _createButton('GesturePage', GesturePage(), 'gesture'),
            _createButton('ResourcePage', ResourcePage(), 'resource'),
            _createButton('WidgetLifecyclePage', WidgetLifecyclePage(), 'lifecycle'),
            _createButton('TabNavigatorPage', TabNavigatorPage(), 'tab'),
            _createButton('ListWidgetPage', ListWidgetPage(), 'list'),
          ],
        ),
      ),
    );
  }

  _createButton(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (_byName) {
            // 通过路由名称跳转
            Navigator.pushNamed(context, routeName);
          } else {
            // 通过页面实例直接跳转
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }

  void _oopLearn() {
    Logger logger1 = Logger();
    logger1.log("123");

    Student student = Student("Ryan", 18, "GitHub");
    Student.say("I say ..." + student.school);
  }
}
