import 'package:flutter/material.dart';
import 'package:plater_flutter/models/recipe_model.dart';
import 'package:plater_flutter/utils/ImageFilter.dart';

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
      body: Stack(
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
                        )
                    ),
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
                  color: Colors.white,
                  fontSize: 30.0,
                  letterSpacing: 1.3
              ),
            ),
          )
        ],
      ),
    );
  }
}
