import 'package:flutter_app/app/model/banner_model.dart';
import 'package:flutter_app/app/model/common_model.dart';
import 'package:flutter_app/app/model/grid_nav_model.dart';
import 'package:flutter_app/app/model/sales_box_model.dart';

import 'config_model.dart';

class HomeModel {
  final ConfigModel config;
  final List<BannerModel> bannerList;
  final List<CommonModel> localNavList;
  final GridNavModel gridNav;
  final List<CommonModel> subNavList;
  final SalesBoxModel salesBox;

  HomeModel(
      {this.config,
      this.bannerList,
      this.localNavList,
      this.gridNav,
      this.subNavList,
      this.salesBox});

  factory HomeModel.fromJsonMap(Map<String, Object> map) {
    var bannerList = map['bannerList'] as List;
    var localNavList = map['localNavList'] as List;
    var subNavList = map['subNavList'] as List;
    return HomeModel(
      config: ConfigModel.fromJsonMap(map['config']),
      bannerList: bannerList.map((e) => BannerModel.fromJsonMap(e)).toList(),
      localNavList:
          localNavList.map((e) => CommonModel.fromJsonMap(e)).toList(),
      gridNav: GridNavModel.fromJsonMap(map['gridNav']),
      subNavList: subNavList.map((e) => CommonModel.fromJsonMap(e)).toList(),
      salesBox: SalesBoxModel.fromJsonMap(map['salesBox']),
    );
  }
}
