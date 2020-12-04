import 'package:flutter/material.dart';
import 'package:plater_flutter/models/recipe_ingredients.dart';
import 'package:plater_flutter/models/recipe_model.dart';
import 'package:plater_flutter/models/recipe_nutrients.dart';
import 'package:plater_flutter/utils/ImageFilter.dart';
import 'package:plater_flutter/views/widgets/IngredientItems.dart';
import 'package:plater_flutter/views/widgets/NutrientItems.dart';

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
                        iconSize: 40.0,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 30.0,
                  bottom: 20.0,
                  right: 10.0,
                  child: Text(
                    recipeName,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.3),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 + 25.0,
              left: 15.0,
              child: Container(
                  height: (MediaQuery.of(context).size.height / 2) - 25.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 28.0),
                        child: Text(
                          'Ingredient List',
                          style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF726B68),
                          ),
                        ),
                      ),
                      Container(
                        height: 200.0,
                        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                        child: Expanded(
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
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 35.0, left: 35.0, top: 18.0),
                        child: Container(
                          height: 0.5,
                          color: Color(0xFFC6C4C4),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 28.0, top: 20.0),
                        child: Text(
                          'Nutrients Fact',
                          style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF726B68),
                          ),
                        ),
                      ),
                      Container(
                        height: 200.0,
                        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                        child: Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 20.0),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return NutrientItems(
                                nutLabel: nutrientItem[index].label,
                                nutTotal: nutrientItem[index].total,
                                nutUnit: nutrientItem[index].unit,
                              );
                            },
                            itemCount: nutrientItem.length,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 35.0, left: 35.0, top: 18.0),
                        child: Container(
                          height: 0.5,
                          color: Color(0xFFC6C4C4),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
