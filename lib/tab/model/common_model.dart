class CommonModel {
  String icon;
  String title;
  String url;
  String statusBarColor;
  String hideAppBar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJsonMap(Map<String, dynamic> map) {
    return CommonModel(
      icon: map['icon'],
      title: map['title'],
      url: map['url'],
      statusBarColor: map['statusBarColor'],
      hideAppBar: map['hideAppBar'],
    );
  }
}
