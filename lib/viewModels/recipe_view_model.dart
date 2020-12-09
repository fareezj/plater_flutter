import 'package:flutter/material.dart';
import 'package:plater_flutter/models/recipe_model.dart';
import 'package:plater_flutter/services/api_services.dart';

class RecipeViewModel extends ChangeNotifier {

  List<RecipeModel> _recipes = List<RecipeModel>();

  bool moreData = false;
  int prevCount = 0;
  int nextCount = 10;

  Future<List<RecipeModel>> getRecipeData(String query) async {
    var recipes = List<RecipeModel>();
    Map<String, dynamic> recipeData =
    await ApiServices().getRecipe(query, prevCount, nextCount);
    moreData = recipeData['more'];
    print('More Data:  $moreData');
    recipeData["hits"].forEach((element) {
      RecipeModel recipeModel = new RecipeModel();
      recipeModel = RecipeModel.fromJson(element['recipe']);
      recipes.add(recipeModel);
      notifyListeners();
    });
    return recipes;
  }


}
