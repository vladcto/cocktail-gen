import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/widgets/cocktail_preview/cocktail_preview_layout.dart';
import 'package:cocktail_gen/data/repos/mock_cocktail.dart';
import 'package:cocktail_gen/domain/entities/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CocktailPreviewPage extends ConsumerWidget {
  final Cocktail cocktail = MockCocktail.cocktail;

  CocktailPreviewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CocktailPreviewLayout(
      cocktail: cocktail,
      isUrlButton: true,
    );
  }
}
