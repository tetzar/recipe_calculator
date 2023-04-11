import 'entity.dart';
import 'ingredient_entity.dart';

class IngredientsBlockEntity implements Entity {
  IngredientsBlockEntity({this.name = ""});

  int? id;
  String name;
  List<IngredientEntity> ingredients = [];

  void addIngredient(IngredientEntity ingredient) {
    ingredients.add(ingredient);
  }

  void removeIngredient(IngredientEntity ingredientEntity) {
    ingredients.removeWhere((ing) => ing.name == ingredientEntity.name);
  }

  List<IngredientEntity> multiplyIngredients(
      IngredientEntity? basedOn, double amountTo) {
    double multipliedBy = amountTo;
    if (basedOn != null) {
      int ingredientIndex =
          this.ingredients.indexWhere((ing) => ing.name == basedOn.name);
      if (ingredientIndex >= 0) {
        IngredientEntity ingredient = this.ingredients[ingredientIndex];
        multipliedBy = multipliedBy / ingredient.amount;
      }
    }
    List<IngredientEntity> ingredients = [];
    for (IngredientEntity originalIngredient in this.ingredients) {
      IngredientEntity ingredient = IngredientEntity(
          name: originalIngredient.name,
          amount: originalIngredient.amount * multipliedBy);
      ingredient.setUnit(originalIngredient.unit);
      ingredient.optimizeUnit();
      ingredients.add(ingredient);
    }
    return ingredients;
  }
}
