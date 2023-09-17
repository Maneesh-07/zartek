import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:zartek/model/Item_model/dish.dart';
import 'dart:convert';

class Apihandler {
static Future<List<MenuCategory>> fetchMenuCategories() async {
  log("calleddddd!!!!!!!!!!!!!!!!1");
  final response = await http
      .get(Uri.parse("https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad"));

  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    final jsonData = result[0]["table_menu_list"] as List<dynamic>;

    final menuCategories =
        jsonData.map((category) => MenuCategory.fromJson(category)).toList();
    return menuCategories;
  } else {
    throw Exception('Failed to load data from the API');
  }
}

}
