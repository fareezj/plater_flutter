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
      body: Stack(children: [
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.network(
                recipeImage,
                fit: BoxFit.cover,
            ),
          ),
        ),
      ]),
    );
  }
}
