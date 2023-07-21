import 'dart:core';

import 'package:cocktail_gen/data/repos/isar/dto/cocktail_isar.dart';
import 'package:cocktail_gen/data/repos/isar/dto/ingredient_measure_isar.dart';
import 'package:cocktail_gen/data/repos/isar/dto/ingredient_thing_isar.dart';
import 'package:cocktail_gen/data/repos/isar/dto/tag_isar.dart';

import 'dto/ingredient_isar.dart';

sealed class InitialDataRepo {
  static List<CocktailIsar> getCocktails() {
    return [
      CocktailIsar(
        name: "1",
        description: "2",
        imageUrl: "3",
        tagsIds: [1],
        ingredients: [
          IngredientMeasureIsar()
            ..name = "Ром"
            ..ingredientId = 0
            ..quantity = 30
            ..unit = MeasureUnitsIsar.milliliters,
        ],
        things: [
          IngredientThingIsar()
            ..ingredientId = 1
            ..name = "Джиггер 30 мл",
        ],
        steps: [
          "a",
          "b",
          "c",
        ],
      ),
    ];
  }

  static List<IngredientIsar> getIngredients() {
    return [
      IngredientIsar(
        id: 0,
        name: "Ром",
        description: "Вкусный",
        type: "Кубинский напиток",
        imageUrl: "2",
      ),
      IngredientIsar(
        id: 1,
        name: "Джиггер",
        description: "Крутой",
        type: "Акссесуар",
        imageUrl: "2",
      ),
    ];
  }

  static List<TagIsar> getTags() {
    return [TagIsar("sdd", id: 0)];
  }
}