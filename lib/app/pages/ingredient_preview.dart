import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/constants/app_radius.dart';
import 'package:cocktail_gen/app/widgets/url_back_button.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const UrlBackButton(),
        title: Text(
          ingredient.name,
          style: TextStyle(
            fontSize: AppFontSize.title,
            color: colorScheme.secondary,
            fontWeight: fontWeight,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Делаем изображение квадратным.
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenWidth,
            child: Image.network(
              ingredient.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          // Виджет текста и подложки
          Positioned.fill(
            child: ListView(
              children: [
                // Чтобы текст немного заехал на изображение.
                SizedBox(height: screenWidth - imagePadding),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.standard,
                    color: colorScheme.background,
                  ),
                  // Учитываем шапку контейнера.
                  padding: EdgeInsets.only(
                    left: AppPaddings.veryLarge,
                    right: AppPaddings.veryLarge,
                    top: imagePadding,
                    bottom: screenWidth,
                  ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
