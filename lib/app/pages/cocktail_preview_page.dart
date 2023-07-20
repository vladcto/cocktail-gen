import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/widgets/additional_layout_info.dart';
import 'package:cocktail_gen/app/widgets/theme_segmented_button.dart';
import 'package:cocktail_gen/data/repos/mock_cocktail.dart';
import 'package:cocktail_gen/domain/entities/cocktail.dart';
import 'package:flutter/material.dart';

enum PreviewType {
  description,
  ingredients,
  steps,
}

@RoutePage()
class CocktailPreviewPage extends StatelessWidget {
  final Cocktail cocktail = MockCocktail.cocktail;

  CocktailPreviewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalLayoutInfo(
      appBarText: cocktail.name,
      imageUrl: cocktail.imageUrl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ThemeSegmentedButton(
              segments: const [
                ButtonSegment(
                  value: PreviewType.description,
                  label: Text("Описание"),
                ),
                ButtonSegment(
                  value: PreviewType.ingredients,
                  label: Text("Ингредиенты"),
                ),
                ButtonSegment(
                  value: PreviewType.steps,
                  label: Text("Шаги"),
                ),
              ],
              initial: PreviewType.description,
              onSelected: (_) {},
            ),
          ),
        ],
      ),
    );
  }
}
