import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'dart_object.dart';


class JsonUtil {//String jsonAssetPath
  static Future loadFromJsonAsync(
  {String file="sections",String index=""}
      ) async {
    String data = await rootBundle.loadString("assets/json_data/$file.json");
    var jsonResult = json.decode(data);
    // print(jsonResult);
    if(file=="sections")
      {
         List<SectionsObject> itemsList=
        List<SectionsObject>.from(jsonResult.map((model) => SectionsObject.fromJson(model)));
        return itemsList;
      }
    else
      {
        List<List<DetailsObject>> itemsList =
        List<List<DetailsObject>>.from(jsonResult.map((model) => List<DetailsObject>.from(model.map((innerModel)=>DetailsObject.fromJson(innerModel)))));
        int i=int.parse(index);
        // print(item.name);
        return itemsList[i];
      }

  }

  static Future<List<T>> loadFromJsonStringAsync<T>(
      String jsonString, Function jsonToObject) async {
    var jsonResult = json.decode(jsonString);
    List<T> items =
    List<T>.from(jsonResult.map((model) => jsonToObject(model)));
    return items;
  }
}