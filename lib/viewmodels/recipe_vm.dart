
import 'package:plater_flutter/models/recipe_model.dart';
import 'package:plater_flutter/services/api_services.dart';

class RecipeVM {

  Future<List<RecipeModel>> getRecipeData(String query) async {
    var recipes = List<RecipeModel>();
    Map<String, dynamic> recipeData =
    await ApiServices().getRecipe(query);
    recipeData["hits"].forEach((element) {
      RecipeModel recipeModel = new RecipeModel();
      recipeModel = RecipeModel.fromJson(element['recipe']);
      recipes.add(recipeModel);
    });
    return recipes;
  }

}