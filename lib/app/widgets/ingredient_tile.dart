import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/constants/app_radius.dart';
import 'package:cocktail_gen/domain/entities/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientTile extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientTile({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: AppRadius.standard,
            child: Image.network(ingredient.imageUrl),
          ),
        ),
        const SizedBox(width: AppPaddings.small),
        Expanded(
          child: Text(
            ingredient.name,
            style: TextStyle(
              fontSize: AppFontSize.title,
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
