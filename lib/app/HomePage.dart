import 'package:flutter/material.dart';
import 'package:flutter_app/app/dao/home_dao.dart';
import 'package:flutter_app/app/model/banner_model.dart';
import 'package:flutter_app/app/model/common_model.dart';
import 'package:flutter_app/app/model/grid_nav_model.dart';
import 'package:flutter_app/app/model/home_model.dart';
import 'package:flutter_app/app/model/sales_box_model.dart';
import 'package:flutter_app/app/widget/grid_item.dart';
import 'package:flutter_app/app/widget/grid_nav.dart';
import 'package:flutter_app/app/widget/sales_box.dart';
import 'package:flutter_app/app/widget/sub_nav.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:toast/toast.dart';

const APPBAR_SCROLL_OFFSET = 200;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _appBarAlpha = 0;
  bool _fetchHomeDataSuccess = false;
  List<BannerModel> _bannerList = [];
  List<CommonModel> _localNavList = [];
  GridNavModel _gridNavModel;
  NavModel _hotel;
  NavModel _flight;
  NavModel _travel;
  List<CommonModel> _subNavList;
  SalesBoxModel _salesBoxModel;

  @override
  void initState() {
    super.initState();
    fetchHomeData();
  }

  void fetchHomeData() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        _fetchHomeDataSuccess = true;
        _bannerList = model.bannerList;
        _localNavList = model.localNavList;
        _gridNavModel = model.gridNav;
        _hotel = _gridNavModel.hotel;
        _flight = _gridNavModel.flight;
        _travel = _gridNavModel.travel;
        _subNavList = model.subNavList;
        _salesBoxModel = model.salesBox;
      });
    } catch (err) {
      _toast(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      // MediaQuery.removePadding可以让布局向状态栏延伸
      body: _fetchHomeDataSuccess ? MediaQuery.removePadding(
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
                          itemCount: _bannerList.length,
                          itemBuilder: (context, index) {
                            return Image.network(
                              _bannerList[index].icon,
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
                        child: GridNavItem(_localNavList),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 6), child: Column(
                        children: <Widget>[
                          HomeGridItem(
                            model: _hotel,
                            topRadius: true,
                          ),
                          HomeGridItem(
                            model: _flight,
                          ),
                          HomeGridItem(
                            model: _travel,
                            bottomRadius: true,
                          ),
                        ],
                      ),),
                      SubNavList(
                        subNavList: _subNavList,
                      ),
                      SalesBox(_salesBoxModel),
                    ],
                  )),
            ],
          )) : Container(),
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
