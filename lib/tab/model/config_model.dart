class ConfigModel {
  String searchUrl;

  ConfigModel({this.searchUrl});

  factory ConfigModel.fromMap(Map<String, dynamic> jsonMap) {
    return ConfigModel(
        searchUrl: jsonMap['searchUrl']
    );
  }
}