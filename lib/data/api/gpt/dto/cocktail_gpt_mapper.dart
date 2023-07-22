import 'package:cocktail_gen/domain/entities/cocktail.dart';
import 'package:cocktail_gen/domain/entities/ingredient_measure.dart';
import 'package:cocktail_gen/domain/entities/ingredient_thing.dart';

import 'cocktail_gpt_dto.dart';

class CocktailGptMapper {
  static const imageAddress =
      "https://horoshop.ua/content/images/11/how-to-use-chat-gpt-91100288650261.jpg";

  static Cocktail mapCocktailGptDtoToCocktail(CocktailGptDto dto) {
    final ingredients = dto.ingredients
        .map((ingredient) => IngredientMeasure(
              name: ingredient,
              quantity:
                  0, 
              unit: MeasureUnits
                  .none, 
            ),)
        .toList();

    final things = dto.things
        .map((thing) => IngredientThing(
              name: thing,
            ))
        .toList();

    return Cocktail(
      name: dto.name,
      description: dto.description,
      imageUrl: dto.imageUrl ?? imageAddress,
      tags: [],
      ingredients: ingredients,
      things: things,
      steps: dto.steps,
    );
  }
}
