import 'package:flutter/material.dart';

class ResourcePage extends StatefulWidget {

  @override
  _State createState() => _State();
}

class _State extends State<ResourcePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Resources use'),
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
                       final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
                       Scaffold.of(context).showSnackBar(snackBar);
                     },
                     child: Container(
                       padding: EdgeInsets.all(10),
                       decoration: BoxDecoration(color: Colors.blue),
                       child: Text('点我'),
                     ),
                   ),
                   SizedBox(height: 10,),
                   Image(image: AssetImage('images/success.png'), width: 100, height: 100,)
                 ],
               )
            ],
          ),
        ),
      ),
    );
  }
}
