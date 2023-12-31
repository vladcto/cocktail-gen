import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/constants/app_radius.dart';
import 'package:cocktail_gen/app/widgets/theme_shimmer.dart';
import 'package:cocktail_gen/domain/entities/ingredient.dart';
import 'package:flutter/material.dart';

/// Карточка, которая отображает имя ингредиента и его картинку.
class IngredientTile extends StatelessWidget {
  static const heroPrefix = "ingredient-";
  final Ingredient ingredient;

  const IngredientTile({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.router.pushNamed(
              "${context.router.currentUrl}/${ingredient.id}",
            );
          },
          child: Hero(
            tag: "$heroPrefix${ingredient.id}",
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: AppRadius.standard,
                child: Image.network(
                  ingredient.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (_, child, event) {
                    if (event == null) return child;
                    return const ThemeShimmer();
                  },
                  errorBuilder: (_, __, ___) => const ThemeShimmer(),
                ),
              ),
            ),
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
