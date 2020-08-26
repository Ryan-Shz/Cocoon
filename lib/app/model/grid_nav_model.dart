import 'package:flutter_app/app/model/common_model.dart';

class GridNavModel {
  final NavModel hotel;
  final NavModel flight;
  final NavModel travel;

  GridNavModel({this.hotel, this.flight, this.travel});

  GridNavModel.fromJsonMap(Map<String, Object> map)
      : this(
          hotel: NavModel.fromJsonMap(map['hotel']),
          flight: NavModel.fromJsonMap(map['flight']),
          travel: NavModel.fromJsonMap(map['travel']),
        );
}

class NavModel {
  final String startColor;
  final String endColor;
  final CommonModel mainItem;
  final CommonModel item1;
  final CommonModel item2;
  final CommonModel item3;
  final CommonModel item4;

  NavModel(
      {this.startColor,
      this.endColor,
      this.mainItem,
      this.item1,
      this.item2,
      this.item3,
      this.item4});

  NavModel.fromJsonMap(Map<String, Object> map)
      : this(
          startColor: map['startColor'],
          endColor: map['endColor'],
          mainItem: CommonModel.fromJsonMap(map['mainItem']),
          item1: CommonModel.fromJsonMap(map['item1']),
          item2: CommonModel.fromJsonMap(map['item2']),
          item3: CommonModel.fromJsonMap(map['item3']),
          item4: CommonModel.fromJsonMap(map['item4']),
        );
}
