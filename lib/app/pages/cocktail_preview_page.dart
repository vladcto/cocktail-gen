import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/widgets/additional_layout_info.dart';
import 'package:cocktail_gen/app/widgets/cocktail_preview/ingredients_preview.dart';
import 'package:cocktail_gen/app/widgets/cocktail_preview/steps_preview.dart';
import 'package:cocktail_gen/app/widgets/theme_segmented_button.dart';
import 'package:cocktail_gen/data/repos/mock_cocktail.dart';
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

@RoutePage()
class CocktailPreviewPage extends ConsumerWidget {
  final Cocktail cocktail = MockCocktail.cocktail;

  CocktailPreviewPage({
    Key? key,
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
              initial: ref.read(_previewTypeProvider),
              onSelected: (type) {
                ref.read(_previewTypeProvider.notifier).state = type;
              },
            ),
          ),
          switch (ref.watch(_previewTypeProvider)) {
            PreviewType.description => _DescriptionPreview(cocktail: cocktail),
            PreviewType.ingredients => IngredientsPreview(
                ingredients: cocktail.ingredients,
              ),
            PreviewType.steps => StepsPreview(steps: cocktail.steps),
          }
        ],
      ),
    );
  }
}

class _DescriptionPreview extends StatelessWidget {
  final Cocktail cocktail;
  const _DescriptionPreview({required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Text(cocktail.description);
  }
}