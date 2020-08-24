import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 200;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _appBarAlpha = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // MediaQuery.removePadding可以让布局向状态栏延伸
      body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          // NotificationListener用于监听子列表滚动
          child: Stack(
            children: <Widget>[
              NotificationListener(
                  onNotification: (notification) {
                    if (notification is ScrollUpdateNotification &&
                        // notification.depth == 0表示只监听ListView的第0个子Widget
                        notification.depth == 0) {
                      _onScroll(notification.metrics.pixels);
                    }
                    return true;
                  },
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 160,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Image.network(
                              'http://via.placeholder.com/350x150',
                            );
                          },
                          pagination: SwiperPagination(),
                          loop: true,
                          duration: 300,
                          autoplay: true,
                        ),
                      ),
                      Container(
                        height: 800,
                        child: ListTile(
                          title: Text("data"),
                        ),
                      )
                    ],
                  )),
              Opacity(
                // Opacity用来改变Widget的透明度
                opacity: _appBarAlpha,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('首页'),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      _appBarAlpha = alpha;
    });
  }
}
