import 'package:cocktail_gen/domain/entities/cocktail.dart';
import 'package:cocktail_gen/domain/entities/ingredient.dart';
import 'package:cocktail_gen/domain/entities/tag.dart';

abstract interface class RecipeRepository {
  Future<void> init();
  List<Ingredient> fetchIngredients();
  List<Cocktail> fetchCocktails();
  List<Tag> fetchTags();
  Ingredient? getIngredientById(int id);
  Cocktail? getCocktailById(int id);
  Tag? getTagById(int id);
}
