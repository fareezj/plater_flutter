
import 'package:plater_flutter/services/network_helper.dart';

class ApiServices {

  Future<dynamic> getRecipe(String recipeName, int prevCount, int nextCount) async {

    String url =
        "https://api.edamam.com/search?q=$recipeName&app_id=161f58ed&app_key=1f5a9543f697df93b7ec78846c10a27a&from=$prevCount&to=$nextCount";

    NetworkHelper networkHelper = NetworkHelper(url: url);
    Map<String, dynamic> recipeData = await networkHelper.getData();

    return recipeData;
  }
}