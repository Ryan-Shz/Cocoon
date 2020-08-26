import 'package:flutter/material.dart';
import 'package:flutter_app/app/dao/home_dao.dart';
import 'package:flutter_app/app/model/home_model.dart';
import 'package:flutter_app/app/widget/grid_nav.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:toast/toast.dart';

const APPBAR_SCROLL_OFFSET = 200;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _appBarAlpha = 0;
  HomeModel _homeModel;

  @override
  void initState() {
    super.initState();
    fetchHomeData();
  }

  void fetchHomeData() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        _homeModel = model;
      });
    } catch (err) {
      _toast(err.toString());
    }
  }

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
                          itemCount: _homeModel?.bannerList?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Image.network(
                              _homeModel.bannerList[index].icon,
                              fit: BoxFit.fill,
                            );
                          },
                          pagination: SwiperPagination(),
                          loop: true,
                          duration: 300,
                          autoplay: true,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                        child: GridNavItem(_homeModel?.localNavList),
                      ),
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

  void _toast(String message) {
    Toast.show(message, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }
}
