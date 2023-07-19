import 'package:cocktail_gen/domain/entities/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_measure.freezed.dart';

/// Единица измерения ингридиентов.
enum MeasureUnits {
  spoons,
  pieces,
  milliliters,
  oz,
  leaves,
  drops,
}

/// Информация о пропорциях [Ingredient].
@freezed
class IngredientMeasure with _$IngredientMeasure {
  @Assert("quantity > 0")
  factory IngredientMeasure({
    /// ID соответствующего [Ingredient].
    required int ingredientId,

    // ? Может выделить в отдельный класс пару [ingredientId] и [ingredientId]
    // ? и назвать [ShortIngredient]?
    // * Во избежания загрузки [Ingredient] здесь есть имя ингредиента.
    /// Имя соответствующего [Ingredient].
    required String name,

    /// Количество ингридиента.
    required double quantity,

    /// Единица измерения количества ингридиента.
    required MeasureUnits unit,
  }) = _IngredientMeasure;
}
