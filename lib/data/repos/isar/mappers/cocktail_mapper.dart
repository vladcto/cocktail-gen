// cocktail.dart
// ignore_for_file: unnecessary_this

import 'package:cocktail_gen/data/repos/isar/controllers/isar_db.dart';
import 'package:cocktail_gen/data/repos/isar/dto/cocktail_isar.dart';
import 'package:cocktail_gen/data/repos/isar/dto/ingredient_measure_isar.dart';
import 'package:cocktail_gen/data/repos/isar/dto/ingredient_thing_isar.dart';
import 'package:cocktail_gen/domain/entities/cocktail.dart';
import 'package:cocktail_gen/domain/entities/ingredient_measure.dart';
import 'package:cocktail_gen/domain/entities/ingredient_thing.dart';

// cocktail_isar.dart
extension CocktailIsarMapper on CocktailIsar {
  Cocktail toCocktail(CocktailIsarDb db) {
    return Cocktail(
      id: this.id,
      name: this.name,
      description: this.description,
      imageUrl: this.imageUrl,
      tags: this.tagsIds.map((id) => db.getTagById(id)!).toList(),
      ingredients: this
          .ingredients
          .map(
            (ingredientIsar) => ingredientIsar.toIngredientMeasure(),
          )
          .toList(),
      things: this
          .things
          .map((thingIsar) => thingIsar.toIngredientThing())
          .toList(),
      steps: this.steps,
    );
  }
}

// ingredient_measure_isar.dart
extension IngredientMeasureIsarMapper on IngredientMeasureIsar {
  IngredientMeasure toIngredientMeasure() {
    return IngredientMeasure(
      ingredientId: this.ingredientId,
      name: this.name,
      quantity: this.quantity,
      unit: _mapMeasureUnits(this.unit),
    );
  }

  MeasureUnits _mapMeasureUnits(MeasureUnitsIsar unit) {
    switch (unit) {
      case MeasureUnitsIsar.none:
        return MeasureUnits.none;
      case MeasureUnitsIsar.spoons:
        return MeasureUnits.spoons;
      case MeasureUnitsIsar.pieces:
        return MeasureUnits.pieces;
      case MeasureUnitsIsar.milliliters:
        return MeasureUnits.milliliters;
      case MeasureUnitsIsar.oz:
        return MeasureUnits.oz;
      case MeasureUnitsIsar.leaves:
        return MeasureUnits.leaves;
      case MeasureUnitsIsar.drops:
        return MeasureUnits.drops;
    }
  }
}

// ingredient_thing_isar.dart
extension IngredientThingIsarMapper on IngredientThingIsar {
  IngredientThing toIngredientThing() {
    return IngredientThing(
      ingredientId: this.ingredientId,
      name: this.name,
    );
  }
}
