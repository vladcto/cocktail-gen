import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/di.dart';
import 'package:cocktail_gen/app/pages/generated_cocktail_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class GeneratorPage extends ConsumerWidget {
  const GeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = context.router;

    return Center(
      child: ElevatedButton(
        onPressed: () {
          ref
              .watch(gptClientProvider)
              .generateRecipe(
                "шипящий",
                "джин",
              )
              .then(
                (e) => router.pushWidget(
                  GeneratedCocktailPreview(cocktail: e),
                ),
              );
        },
        child: Text("Press me"),
      ),
    );
  }
}
