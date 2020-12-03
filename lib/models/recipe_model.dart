
class RecipeModel {

  final String image;
  final String url;
  final String source;
  final String label;
  final List ingredients;

  RecipeModel({this.image, this.url, this.source, this.label, this.ingredients});

  factory RecipeModel.fromJson(Map<String, dynamic> parsedJson) {
    return RecipeModel(
      image: parsedJson["image"],
      url: parsedJson["url"],
      source: parsedJson["source"],
      label: parsedJson["label"],
      ingredients: parsedJson['ingredients']
    );
  }
}