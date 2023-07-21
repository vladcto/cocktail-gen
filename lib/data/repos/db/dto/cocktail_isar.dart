import 'package:cocktail_gen/data/repos/db/dto/ingredient_thing_isar.dart';
import 'package:isar/isar.dart';

import 'ingredient_measure_isar.dart';

part 'cocktail_isar.g.dart';

@collection
class CocktailIsar {
  Id id = Isar.autoIncrement;

  final String name;
  final String description;
  final String imageUrl;
  final List<Id> tagsIds;
  final List<IngredientMeasureIsar> ingredients;
  final List<IngredientThingIsar> things;
  final List<String> steps;

  CocktailIsar(
    this.name,
    this.description,
    this.imageUrl,
    this.tagsIds,
    this.ingredients,
    this.things,
    this.steps,
  );
}
