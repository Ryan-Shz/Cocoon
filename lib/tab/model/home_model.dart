import 'package:flutter_app/tab/model/banner_model.dart';
import 'package:flutter_app/tab/model/common_model.dart';

import 'config_model.dart';

class HomeModel {
  final ConfigModel config;
  final List<BannerModel> bannerList;
  final List<CommonModel> localNavList;

  HomeModel({this.config, this.bannerList, this.localNavList});
}
