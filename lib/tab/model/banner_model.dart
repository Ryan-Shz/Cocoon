class BannerModel {
  String icon;
  String url;

  BannerModel({this.icon, this.url});

  factory BannerModel.fromJson(Map<String, dynamic> map) {
    return BannerModel(icon: map['icon'], url: map['url']);
  }
}
