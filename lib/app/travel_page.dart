import 'package:flutter/material.dart';
import 'package:flutter_app/app/dao/travel_tab_dao.dart';
import 'package:flutter_app/app/model/travel_tab_model.dart';
import 'package:flutter_app/app/utils/statusbar_utils.dart';
import 'package:flutter_app/app/widget/loading.dart';
import 'package:flutter_app/app/widget/travel_tab_page.dart';
import 'package:underline_indicator/underline_indicator.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage>
    with SingleTickerProviderStateMixin {
  List<TravelTab> _tabs;
  Map _params;
  String _url;
  bool isLoadCompleted = false;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    loadTravelTabData();
  }

  void loadTravelTabData() async {
    TravelTabModel model = await TravelTabDao.fetch();
    setState(() {
      _tabs = model.tabs;
      _url = model.url;
      _params = model.params;
      _tabController = TabController(length: _tabs.length, vsync: this);
      isLoadCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoadCompleted
          ? Column(
              children: <Widget>[
                _tabBar(),
                _tabView(),
              ],
            )
          : LoadingWidget(),
    );
  }

  _tabBar() {
    return Container(
      margin: EdgeInsets.only(top: StatusBarUtils.getStatusBarHeight(context)),
      child: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.black,
          labelPadding: EdgeInsets.fromLTRB(20, 0, 10, 5),
          indicator: UnderlineIndicator(
              strokeCap: StrokeCap.round,
              borderSide: BorderSide(
                color: Color(0xff2fcfbb),
                width: 3,
              ),
              insets: EdgeInsets.only(bottom: 10)),
          tabs: _tabs.map((e) {
            return Tab(
              text: e.labelName,
            );
          }).toList()),
    );
  }

  _tabView() {
    return Flexible(
        child: TabBarView(
            controller: _tabController,
            children: _tabs.map((tab) {
              return TravelTabPage(
                params: _params,
                travelUrl: _url,
                groupChannelCode: tab.groupChannelCode,
              );
            }).toList()));
  }
}
