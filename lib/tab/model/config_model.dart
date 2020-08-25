class ConfigModel {
  final String searchUrl;

  ConfigModel({this.searchUrl});

  ConfigModel.fromJsonMap(Map<String, Object> jsonMap)
      : this(searchUrl: jsonMap['searchUrl']);
}
