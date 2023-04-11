
import '../entities/recipe_entity.dart';

abstract class RecipeRepository {
  Future<void> saveRecipe(RecipeEntity recipe);
  Future<RecipeEntity?> getRecipe(int id);
  Future<List<RecipeEntity>> getRecipes();
  Future<void> deleteRecipe(int id);
}