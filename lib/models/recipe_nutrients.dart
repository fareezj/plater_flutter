
class RecipeNutrients {

  final String label;
  final double total;
  final String unit;

  RecipeNutrients({this.label, this.total, this.unit});

  factory RecipeNutrients.fromJson(Map<String, dynamic> parsedJson) {
    return RecipeNutrients(
      label: parsedJson['label'],
      total: parsedJson['total'],
      unit: parsedJson['unit'],
    );
  }
}