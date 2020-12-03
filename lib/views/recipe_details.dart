import 'package:flutter/material.dart';
import 'package:plater_flutter/models/recipe_ingredients.dart';
import 'package:plater_flutter/models/recipe_model.dart';
import 'package:plater_flutter/models/recipe_nutrients.dart';
import 'package:plater_flutter/utils/ImageFilter.dart';
import 'package:plater_flutter/views/widgets/IngredientItems.dart';

class RecipeDetails extends StatefulWidget {
  RecipeDetails({this.recipeDetailsData});
  final List<RecipeModel> recipeDetailsData;

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  String recipeName;
  String recipeImage;
  String recipeSource;
  List recipeIngredients;
  List recipeNutrients;
  List<RecipeIngredients> ingredientsItem = List<RecipeIngredients>();
  List<RecipeNutrients> nutrientItem = List<RecipeNutrients>();

  @override
  void initState() {
    super.initState();

    var collectedData = widget.recipeDetailsData;
    collectedData.forEach((element) {
      recipeName = element.label;
      recipeImage = element.image;
      recipeSource = element.source;
      recipeIngredients = element.ingredients;
      recipeNutrients = element.nutrients;

      recipeIngredients.forEach((element) {
        RecipeIngredients recipeIngredients = new RecipeIngredients();
        recipeIngredients = RecipeIngredients.fromJson(element);
        ingredientsItem.add(recipeIngredients);
      });

      recipeNutrients.forEach((element) {
        RecipeNutrients recipeNutrients = new RecipeNutrients();
        recipeNutrients = RecipeNutrients.fromJson(element);
        nutrientItem.add(recipeNutrients);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: recipeImage,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: ImageFilter(
                        // DEFAULT IMAGE CONFIG:
                        // HUE: 0.0
                        // BRIGHTNESS: 0.1
                        // SATURATION: 0.0
                        hue: 0.0,
                        brightness: -0.09,
                        saturation: 0.1,
                        child: Container(
                            decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(recipeImage),
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios_rounded),
                        onPressed: () => Navigator.pop(context),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 30.0,
                  bottom: 20.0,
                  child: Text(
                    recipeName,
                    style: TextStyle(
                        color: Colors.white, fontSize: 30.0, letterSpacing: 1.3),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  height: 210.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Ingredient List',
                        style: TextStyle(
                          height: 1.8,
                          fontSize: 23.0,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return IngredientItems(
                              ingItem: ingredientsItem[index].text,
                              ingWeight: ingredientsItem[index].weight,
                              ingImage: ingredientsItem[index].image != null
                                  ? ingredientsItem[index].image
                                  : "https://cdn1.iconfinder.com/data/icons/symbol-set-1/100/Untitled-2-63-512.png",
                            );
                          },
                          itemCount: ingredientsItem.length,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}