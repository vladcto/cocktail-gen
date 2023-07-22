import 'dart:convert';

import 'package:cocktail_gen/data/repos/isar/dto/cocktail_isar.dart';
import 'package:cocktail_gen/data/repos/isar/dto/ingredient_isar.dart';
import 'package:cocktail_gen/data/repos/isar/dto/tag_isar.dart';
import 'package:cocktail_gen/data/repos/isar/mappers/cocktail_mapper.dart';
import 'package:cocktail_gen/data/repos/isar/mappers/ingredient_mapper.dart.dart';
import 'package:cocktail_gen/data/repos/isar/mappers/tag_mapper.dart';
import 'package:cocktail_gen/domain/entities/cocktail.dart';
import 'package:cocktail_gen/domain/entities/ingredient.dart';
import 'package:cocktail_gen/domain/entities/tag.dart';
import 'package:cocktail_gen/interfaces/db_repository.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class CocktailIsarDb implements RecipeRepository {
  late List<CocktailIsar> cocktails;
  late List<IngredientIsar> ingredients;
  late List<TagIsar> tags;
  late Isar isar;

  @override
  List<Cocktail> fetchCocktails() {
    return cocktails.map((e) => e.toCocktail(this)).toList();
  }

  @override
  List<Ingredient> fetchIngredients() {
    return ingredients.map((e) => e.toIngredient()).toList();
  }

  @override
  List<Tag> fetchTags() {
    return tags.map((e) => e.toTag()).toList();
  }

  @override
  Cocktail? getCocktailById(int id) {
    return isar.cocktailIsars.getSync(id)?.toCocktail(this);
  }

  @override
  Ingredient? getIngredientById(int id) {
    return isar.ingredientIsars.getSync(id)?.toIngredient();
  }

  @override
  Tag? getTagById(int id) {
    return isar.tagIsars.getSync(id)?.toTag();
  }

  @override
  Future<void> init() async {
    final dir = await getApplicationSupportDirectory();
    isar = await Isar.open(
      [CocktailIsarSchema, IngredientIsarSchema, TagIsarSchema],
      directory: dir.path,
    );

    final cocktailCount = await isar.cocktailIsars.count();
    if (cocktailCount == 0) await _init();

    cocktails = await isar.cocktailIsars.where().findAll();
    ingredients = await isar.ingredientIsars.where().findAll();
    tags = await isar.tagIsars.where().findAll();
  }

  Future<void> _init() async {
    await isar.writeTxn(
      () async {
        final cocktailData =
            await rootBundle.loadString('assets/isar/CocktailIsar.json');
        await isar.cocktailIsars.importJson(
          (jsonDecode(cocktailData) as List<dynamic>)
              .map(
                (e) => e as Map<String, dynamic>,
              )
              .toList(),
        );

        final ingredientData =
            await rootBundle.loadString('assets/isar/IngredientIsar.json');
        await isar.ingredientIsars.importJson(
          (jsonDecode(ingredientData) as List<dynamic>)
              .map(
                (e) => e as Map<String, dynamic>,
              )
              .toList(),
        );

        final tagData = await rootBundle.loadString('assets/isar/TagIsar.json');
        await isar.tagIsars.importJson(
          (jsonDecode(tagData) as List<dynamic>)
              .map(
                (e) => e as Map<String, dynamic>,
              )
              .toList(),
        );
      },
    );
  }
}
