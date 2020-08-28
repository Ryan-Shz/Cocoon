import 'dart:convert';

import 'package:flutter_app/app/model/search_model.dart';
import 'package:http/http.dart' as http;

class SearchDao {
  static Future<SearchModel> fetch(String url) async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // 服务器接口中包含中文，且用的是UTF-8编码
      // 这里用UTF-8解码，避免乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      String result = utf8decoder.convert(response.bodyBytes);
      Map<String, Object> map = json.decode(result);
      return SearchModel.fromJson(map);
    } else {
      throw Exception('fetch search data failed.');
    }
  }
}
