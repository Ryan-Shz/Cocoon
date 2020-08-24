import 'package:flutter/material.dart';

class WidgetLifecyclePage extends StatefulWidget {

  // 1.
  @override
  _WidgetLifecyclePageState createState() => _WidgetLifecyclePageState();
}

class _WidgetLifecyclePageState extends State<WidgetLifecyclePage> with WidgetsBindingObserver {
  int _count = 0;

  // 2.
  @override
  void initState() {
    super.initState();
    print('initState');
    WidgetsBinding.instance.addObserver(this);
  }

  // 3.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  // 4.
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('$_count'),
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                })
          ],
        ),
      ),
    );
  }

  // 5.
  @override
  void didUpdateWidget(WidgetLifecyclePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  // 6.
  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  // 7.
  @override
  void dispose() {
    super.dispose();
    print('dispose');
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("didChangeAppLifecycleState: ${state.toString()}");
  }
}
