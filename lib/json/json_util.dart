import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:sky_goal/json/dart_object.dart';

class JsonUtil {//String jsonAssetPath
  static Future<List<T>> loadFromJsonAsync<T>(
      ) async {
    String data = await rootBundle.loadString("assets/json_data/sections.json");
    var jsonResult = json.decode(data);
    print(jsonResult);
    List<T> items =
    List<T>.from(jsonResult.map((model) => SectionsObject.fromJson(model)));
    return items;
  }

  static Future<List<T>> loadFromJsonStringAsync<T>(
      String jsonString, Function jsonToObject) async {
    var jsonResult = json.decode(jsonString);
    List<T> items =
    List<T>.from(jsonResult.map((model) => jsonToObject(model)));
    return items;
  }
}