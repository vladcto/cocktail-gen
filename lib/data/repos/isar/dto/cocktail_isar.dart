import 'package:isar/isar.dart';

import 'ingredient_measure_isar.dart';
import 'ingredient_thing_isar.dart';

part 'cocktail_isar.g.dart';

@collection
class CocktailIsar {
  final Id id;
  final String name;
  final String description;
  final String imageUrl;
  final List<Id> tagsIds;
  final List<IngredientMeasureIsar> ingredients;
  final List<IngredientThingIsar> things;
  final List<String> steps;

  CocktailIsar({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.tagsIds,
    required this.ingredients,
    required this.things,
    required this.steps,
  });
}
