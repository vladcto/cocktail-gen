import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/widgets/cocktail_preview/ingredient_measure_tile.dart';
import 'package:cocktail_gen/domain/entities/ingredient_measure.dart';
import 'package:flutter/material.dart';

class IngredientsPreview extends StatelessWidget {
  final List<IngredientMeasure> ingredients;

  const IngredientsPreview({Key? key, required this.ingredients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}
