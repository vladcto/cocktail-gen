import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/widgets/additional_layout_info.dart';
import 'package:cocktail_gen/app/widgets/cocktail_preview/description_preview.dart';
import 'package:cocktail_gen/app/widgets/cocktail_preview/ingredients_preview.dart';
import 'package:cocktail_gen/app/widgets/cocktail_preview/steps_preview.dart';
import 'package:cocktail_gen/app/widgets/theme_segmented_button.dart';
import 'package:cocktail_gen/domain/entities/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PreviewType {
  description,
  ingredients,
  steps,
}

final _previewTypeProvider = StateProvider(
  (ref) => PreviewType.description,
);

/// Страница, отображающая информацию о [Cocktail].
class CocktailPreviewLayout extends ConsumerWidget {
  final Cocktail cocktail;

  const CocktailPreviewLayout({
    Key? key,
    required this.cocktail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdditionalLayoutInfo(
      appBarText: cocktail.name,
      imageUrl: cocktail.imageUrl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPaddings.medium),
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
              initial: ref.read(_previewTypeProvider),
              onSelected: (type) {
                ref.read(_previewTypeProvider.notifier).state = type;
              },
            ),
          ),
          const SizedBox(height: AppPaddings.medium),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPaddings.large),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: switch (ref.watch(_previewTypeProvider)) {
                PreviewType.description =>
                  DescriptionPreview(cocktail: cocktail),
                PreviewType.ingredients => IngredientsPreview(
                    ingredients: cocktail.ingredients,
                    things: cocktail.things,
                  ),
                PreviewType.steps => StepsPreview(steps: cocktail.steps),
              },
            ),
          )
        ],
      ),
    );
  }
}
