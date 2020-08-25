import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {

  @override
  _State createState() => _State();
}

class _State extends State<GesturePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gesture'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
               Column(
                 children: <Widget>[
                   GestureDetector(
                     onTap: () {
                       print('onTap');
                     },
                     child: Container(
                       padding: EdgeInsets.all(10),
                       decoration: BoxDecoration(color: Colors.blue),
                       child: Text('点我'),
                     ),
                   )
                 ],
               )
            ],
          ),
        ),
      ),
    );
  }
}
