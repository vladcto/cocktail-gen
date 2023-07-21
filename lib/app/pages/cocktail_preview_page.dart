import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/di.dart';
import 'package:cocktail_gen/app/navigation/router.dart';
import 'package:cocktail_gen/app/widgets/cocktail_preview/cocktail_preview_layout.dart';
import 'package:cocktail_gen/interfaces/db_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CocktailPreviewPage extends ConsumerWidget {
  final int cocktailId;
  const CocktailPreviewPage(
    @PathParam(AppRouter.cocktailParam) this.cocktailId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CocktailPreviewLayout(
      cocktail: getIt<RecipeRepository>().getCocktailById(cocktailId)!,
    );
  }
}
