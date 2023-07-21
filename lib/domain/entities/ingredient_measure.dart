import 'package:cocktail_gen/domain/entities/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_measure.freezed.dart';
part 'ingredient_measure.g.dart';

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
    ///
    /// -1 если ингредиента не существует в базе данных.
    @Default(-1) int ingredientId,

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

  factory IngredientMeasure.fromJson(Map<String, dynamic> json) =>
      _$IngredientMeasureFromJson(json);
}
