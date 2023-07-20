import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/constants/app_radius.dart';
import 'package:cocktail_gen/app/widgets/url_back_button.dart';
import 'package:cocktail_gen/data/repos/mock_ingredient.dart';
import 'package:cocktail_gen/domain/entities/ingredient.dart';
import 'package:flutter/material.dart';

@RoutePage()
class IngredientPreviewPage extends StatelessWidget {
  static const double imagePadding = 32;
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
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Stack(
        children: [
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
          Positioned.fill(
            child: ListView(
              children: [
                SizedBox(height: screenWidth - imagePadding),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.standard,
                    color: colorScheme.background,
                  ),
                  padding: EdgeInsets.only(
                    left: AppPaddings.medium,
                    right: AppPaddings.medium,
                    top: imagePadding,
                    bottom: screenWidth / 2,
                  ),
                  child: Text(
                    ingredient.description,
                    style: const TextStyle(fontSize: 32),
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

class ThemeSliverAppBar extends StatelessWidget {
  const ThemeSliverAppBar({
    super.key,
    required this.ingredient,
  });

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;

    return SliverAppBar(
      pinned: true,
      expandedHeight: width,
      automaticallyImplyLeading: true,
      backgroundColor: Colors.transparent,
      leading: const UrlBackButton(),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          ingredient.imageUrl,
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        expandedTitleScale: 1,
        title: LayoutBuilder(
          builder: (context, constraints) {
            double perc = min(
              1,
              (constraints.maxHeight - kToolbarHeight) / (width * 0.7),
            );

            return Container(
              width: double.infinity,
              height: kToolbarHeight + 32 * perc,
              color: colorScheme.background.withOpacity(
                max(0.6, 1 - perc),
              ),
              alignment: Alignment.center,
              child: Text(
                ingredient.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppFontSize.title,
                  color: colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
