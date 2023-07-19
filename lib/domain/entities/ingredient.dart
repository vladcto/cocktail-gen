import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

@freezed
class Ingredient with _$Ingredient {
  factory Ingredient({
    required int id,
    required String name,
    required String description,
    required String imageUrl,
  }) = _Ingredient;
}
