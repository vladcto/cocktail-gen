import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/di.dart';
import 'package:cocktail_gen/app/navigation/router.dart';
import 'package:cocktail_gen/app/widgets/additional_layout_info.dart';
import 'package:cocktail_gen/app/widgets/ingredient_tile.dart';
import 'package:cocktail_gen/interfaces/db_repository.dart';
import 'package:flutter/material.dart';

/// Страница, отображающая информация о ингредиенте.
@RoutePage()
class IngredientPreviewPage extends StatelessWidget {
  static const double imagePadding = 32;
  static const fontWeight = FontWeight.w500;

  final int ingredientId;

  const IngredientPreviewPage(
    @PathParam(AppRouter.ingredientParam) this.ingredientId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ingredient = getIt<RecipeRepository>().getIngredientById(
      ingredientId,
    )!;
    final colorScheme = Theme.of(context).colorScheme;

    return AdditionalLayoutInfo(
      appBarText: ingredient.name,
      imageUrl: ingredient.imageUrl,
      heroTag: "${IngredientTile.heroPrefix}${ingredient.id}",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPaddings.veryLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ingredient.type,
              style: TextStyle(
                fontSize: AppFontSize.title,
                fontWeight: fontWeight,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppPaddings.medium),
            Text(
              ingredient.description,
              style: TextStyle(
                fontSize: AppFontSize.title,
                fontWeight: fontWeight,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
