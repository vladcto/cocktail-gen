import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/widgets/cocktail_preview/ingredient_measure_tile.dart';
import 'package:cocktail_gen/app/widgets/cocktail_preview/ingredient_thing_tile.dart';
import 'package:cocktail_gen/domain/entities/ingredient_measure.dart';
import 'package:cocktail_gen/domain/entities/ingredient_thing.dart';
import 'package:flutter/material.dart';

class IngredientsPreview extends StatelessWidget {
  final List<IngredientMeasure> ingredients;
  final List<IngredientThing> things;

  const IngredientsPreview({
    Key? key,
    required this.ingredients,
    required this.things,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // * Ингредиенты
        Padding(
          // Игнорируем отступы [CheckBox]. Костыль, но эффективное решение.
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            "Ингредиенты",
            style: TextStyle(
              color: colorScheme.onSurface,
              fontSize: AppFontSize.title,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(height: AppPaddings.small),
        ...ingredients
            .map(
              (e) => IngredientMeasureTile(measure: e),
            )
            .toList(),
        // * Штучки
        const SizedBox(height: AppPaddings.large),
        Padding(
          // Игнорируем отступы [CheckBox]. Костыль, но эффективное решение.
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            "Штучки",
            style: TextStyle(
              color: colorScheme.onSurface,
              fontSize: AppFontSize.title,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(height: AppPaddings.small),
        ...things
            .map(
              (e) => IngredientThingTile(thing: e),
            )
            .toList(),
      ],
    );
  }
}
