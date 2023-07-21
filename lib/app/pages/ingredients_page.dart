import 'package:auto_route/annotations.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/widgets/ingredient_tile.dart';
import 'package:cocktail_gen/interfaces/db_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

/// Страница, отображающая список всех ингредиентов.
@RoutePage()
class IngredientsPage extends StatelessWidget {
  static const double itemsPadding = AppPaddings.medium;

  const IngredientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        // Ставим отступ в [large] учитывая отступ вокруг детей.
        vertical: AppPaddings.large - itemsPadding / 2,
        horizontal: AppPaddings.medium,
      ),
      children: [
        for (final ingredient in GetIt.I<RecipeRepository>().fetchIngredients())
          Padding(
            padding: const EdgeInsets.symmetric(vertical: itemsPadding / 2),
            child: SizedBox(
              height: 96,
              child: IngredientTile(ingredient: ingredient),
            ),
          ),
      ],
    );
  }
}
