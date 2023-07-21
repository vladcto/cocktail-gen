import 'package:cocktail_gen/data/api/gpt/dto/cocktail_gpt_dto.dart';
import 'package:cocktail_gen/data/api/gpt/dto/cocktail_gpt_mapper.dart';
import 'package:cocktail_gen/domain/entities/ingredient_measure.dart';
import 'package:cocktail_gen/domain/entities/ingredient_thing.dart';
import 'package:test/test.dart';

const String dataWithNewLines = """name: "Экстази"
description: "описание 'Экстази'!"
ingredients: ["1","2","3","4"]
things: ["шейкер", "мадлер", "пияла", "стакан олд-фэшн"]
step: ["Наполните шейкер кубиками льда", 
"Добавьте куантро, колу, водку, лимонный сок и клубничный сироп", 
"Хорошо взболтайте шейкер", 
"Процедите содержимое в стакан олд-фэшн, наполненный льдом", 
"Украсьте коктейль долькой лимона или клубникой", 
"Готовый коктейль подавайте с мадлером и пиялой"]""";

void main() {
  group(
    'GPT TEST',
    () {
      test(
        "DTO",
        () {
          final CocktailGptDto dto =
              CocktailGptDto.fromString(dataWithNewLines);
          expect(dto.name, "Экстази");
          expect(dto.description, "описание 'Экстази'!");
          expect(dto.ingredients, ["1", "2", "3", "4"]);
          expect(dto.things, ["шейкер", "мадлер", "пияла", "стакан олд-фэшн"]);
          expect(
            dto.steps,
            [
              "Наполните шейкер кубиками льда",
              "Добавьте куантро, колу, водку, лимонный сок и клубничный сироп",
              "Хорошо взболтайте шейкер",
              "Процедите содержимое в стакан олд-фэшн, наполненный льдом",
              "Украсьте коктейль долькой лимона или клубникой",
              "Готовый коктейль подавайте с мадлером и пиялой"
            ],
          );
        },
      );

      test(
        "DTO TO ENTITY",
        () {
          final CocktailGptDto dto =
              CocktailGptDto.fromString(dataWithNewLines);
          final cocktailFromDto =
              CocktailGptMapper.mapCocktailGptDtoToCocktail(dto);
          expect(cocktailFromDto.name, "Экстази");
          expect(cocktailFromDto.description, "описание 'Экстази'!");
          expect(cocktailFromDto.ingredients, [
            IngredientMeasure(
              name: "1",
              quantity: 0,
              unit: MeasureUnits.none,
            ),
            IngredientMeasure(
              name: "2",
              quantity: 0,
              unit: MeasureUnits.none,
            ),
            IngredientMeasure(
              name: "3",
              quantity: 0,
              unit: MeasureUnits.none,
            ),
            IngredientMeasure(
              name: "4",
              quantity: 0,
              unit: MeasureUnits.none,
            ),
          ]);
          expect(cocktailFromDto.things, [
            IngredientThing(
              name: "шейкер",
            ),
            IngredientThing(
              name: "мадлер",
            ),
            IngredientThing(
              name: "пияла",
            ),
            IngredientThing(
              name: "стакан олд-фэшн",
            ),
          ]);
          expect(
            cocktailFromDto.steps,
            [
              "Наполните шейкер кубиками льда",
              "Добавьте куантро, колу, водку, лимонный сок и клубничный сироп",
              "Хорошо взболтайте шейкер",
              "Процедите содержимое в стакан олд-фэшн, наполненный льдом",
              "Украсьте коктейль долькой лимона или клубникой",
              "Готовый коктейль подавайте с мадлером и пиялой"
            ],
          );
        },
      );
    },
  );
  // test
}
