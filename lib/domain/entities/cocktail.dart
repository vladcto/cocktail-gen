import 'package:cocktail_gen/domain/entities/ingredient_thing.dart';
import 'package:cocktail_gen/domain/entities/tag.dart';

import 'ingredient_measure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cocktail.freezed.dart';

@freezed
class Cocktail with _$Cocktail {
  @Assert("steps.length > 0")
  @Assert("ingredients.length > 0")
  factory Cocktail({
    /// ID рецепта в БД.
    /// 
    /// -1 если рецепт не существует в БД.
    @Default(-1) int id,
    required String name,
    required String description,
    required String imageUrl,
    required List<Tag> tags,
    required List<IngredientMeasure> ingredients,
    required List<IngredientThing> things,
    required List<String> steps,
  }) = _Cocktail;
}
