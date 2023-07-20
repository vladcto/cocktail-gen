import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_thing.freezed.dart';

/// Информация о "штучках" в рецепте. (джиггеры, шейкеры и тд.)
@freezed
abstract class IngredientThing with _$IngredientThing {
  factory IngredientThing({
    /// ID соответствующего ингредиента.
    ///
    /// -1 - если ингредиент не существует в БД.
    @Default(-1) int ingredientId,
    required String name,
  }) = _IngredientThing;
}
