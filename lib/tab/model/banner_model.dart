class BannerModel {
  String icon;
  String url;

  BannerModel({this.icon, this.url});

  BannerModel.fromJsonMap(Map<String, Object> map)
      : this(icon: map['icon'], url: map['url']);
}
