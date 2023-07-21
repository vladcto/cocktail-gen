// ingredient_isar.dart
// ignore_for_file: unnecessary_this

import 'package:cocktail_gen/data/repos/isar/dto/ingredient_isar.dart';
import 'package:cocktail_gen/domain/entities/ingredient.dart';

extension IngredientIsarMapper on IngredientIsar {
  Ingredient toIngredient() {
    return Ingredient(
      id: this.id,
      name: this.name,
      description: this.description,
      type: this.type,
      imageUrl: this.imageUrl,
    );
  }
}
