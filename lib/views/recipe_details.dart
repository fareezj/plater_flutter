import 'package:flutter/material.dart';
import 'package:plater_flutter/models/recipe_model.dart';

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

  @override
  void initState() {
    super.initState();
    var collectedData = widget.recipeDetailsData;
    collectedData.forEach((element) {
      recipeName = element.label;
      recipeImage = element.image;
      recipeSource = element.source;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
      ),
      body: Column(
        children: [
          Image.network(recipeImage),
          Text(recipeName),
          Text(recipeSource),
        ],
      ),
    );
  }
}
