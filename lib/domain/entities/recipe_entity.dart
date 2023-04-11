import 'Ingredients_block.dart';
import 'entity.dart';
import 'operation_block_entity.dart';

class RecipeEntity implements Entity {
  int? id;
  String name = "";
  int servings = 1;
  List<IngredientsBlockEntity> ingredientsBlocks = [];
  List<OperationBlockEntity> operationBlocks = [];

  void setName(String name) {
    this.name = name;
  }

  void changeServings(int servings) {
    this.servings = servings;
  }

  void addIngredientBlock(IngredientsBlockEntity ingredients) {
    ingredientsBlocks.add(ingredients);
  }

  void removeIngredientBlock(IngredientsBlockEntity ingredients) {
    ingredientsBlocks.remove(ingredients);
  }

  void addOperationBlock(OperationBlockEntity operations) {
    operationBlocks.add(operations);
  }

  void removeOperationBlock(OperationBlockEntity operations) {
    operationBlocks.remove(operations);
  }
}
