
import 'package:recipe_calculator/domain/repository/recipe_repository.dart';
import 'package:recipe_calculator/domain/use_case/use_case.dart';

import '../entities/recipe_entity.dart';

class RecipeCreationUseCase implements UseCase {
  RecipeCreationUseCase(this.repository);
  final RecipeRepository repository;


}