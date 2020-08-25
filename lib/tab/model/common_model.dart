class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final String hideAppBar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  CommonModel.fromJsonMap(Map<String, Object> map)
      : this(
          icon: map['icon'],
          title: map['title'],
          url: map['url'],
          statusBarColor: map['statusBarColor'],
          hideAppBar: map['hideAppBar'],
        );
}
