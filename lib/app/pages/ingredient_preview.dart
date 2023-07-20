import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/widgets/additional_layout_info.dart';
import 'package:cocktail_gen/data/repos/mock_ingredient.dart';
import 'package:flutter/material.dart';

/// Страница, отображающая информация о ингредиенте.
@RoutePage()
class IngredientPreviewPage extends StatelessWidget {
  static const double imagePadding = 32;
  static const fontWeight = FontWeight.w500;
  const IngredientPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ingredient = MockIngredient.ingredient;
    final colorScheme = Theme.of(context).colorScheme;

    return AdditionalLayoutInfo(
      appBarText: ingredient.name,
      imageUrl: ingredient.imageUrl,
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
