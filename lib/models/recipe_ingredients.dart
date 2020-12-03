import 'dart:ffi';

class RecipeIngredients {

  final String text;
  final double weight;
  final String image;

  RecipeIngredients({this.text, this.weight, this.image});

  factory RecipeIngredients.fromJson(Map<String, dynamic> parsedJson) {
    return RecipeIngredients(
      text: parsedJson["text"],
      weight: parsedJson["weight"],
      image: parsedJson["image"]
    );
  }
}