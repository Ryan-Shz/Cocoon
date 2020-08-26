import 'package:flutter_app/app/model/common_model.dart';

class SalesBoxModel {
  final String icon;
  final String moreUrl;
  final CommonModel bigCard1;
  final CommonModel bigCard2;
  final CommonModel smallCard1;
  final CommonModel smallCard2;
  final CommonModel smallCard3;
  final CommonModel smallCard4;

  SalesBoxModel(
      {this.icon,
      this.moreUrl,
      this.bigCard1,
      this.bigCard2,
      this.smallCard1,
      this.smallCard2,
      this.smallCard3,
      this.smallCard4});

  SalesBoxModel.fromJsonMap(Map<String, Object> map)
      : this(
          icon: map['icon'],
          moreUrl: map['moreUrl'],
          bigCard1: CommonModel.fromJsonMap(map['bigCard1']),
          bigCard2: CommonModel.fromJsonMap(map['bigCard2']),
          smallCard1: CommonModel.fromJsonMap(map['smallCard1']),
          smallCard2: CommonModel.fromJsonMap(map['smallCard2']),
          smallCard3: CommonModel.fromJsonMap(map['smallCard3']),
          smallCard4: CommonModel.fromJsonMap(map['smallCard4']),
        );
}
