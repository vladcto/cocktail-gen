import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/pages/generated_cocktail_preview.dart';
import 'package:cocktail_gen/data/api/gpt/dto/gpt_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final _tagsProvider = StateProvider<String>((_) => "");
final _ingredientsProvider = StateProvider<String>((_) => "");

@RoutePage()
class GeneratorPage extends ConsumerWidget {
  const GeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = context.router;
    final messenger = ScaffoldMessenger.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.large * 3),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                label: Text("Теги через запятую"),
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => ref.read(_tagsProvider.notifier).state = val,
            ),
            const SizedBox(height: AppPaddings.medium),
            TextField(
              decoration: const InputDecoration(
                label: Text("Ингредиенты через запятую"),
                border: OutlineInputBorder(),
              ),
              onChanged: (val) =>
                  ref.read(_ingredientsProvider.notifier).state = val,
            ),
            const SizedBox(height: AppPaddings.veryLarge * 3),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  final tags = ref.read(_tagsProvider);
                  final ingredients = ref.read(_ingredientsProvider);
                  _generateRecipe(tags, ingredients, router);
                },
                child: const Text("Придумать"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Object?>? _generateRecipe(
    String tags,
    String ingredients,
    StackRouter router,
  ) {
    return runZonedGuarded(
      () => GetIt.I<GptClient>()
          .generateRecipe(
            tags,
            ingredients,
          )
          .then(
            (e) => router.pushWidget(
              GeneratedCocktailPreview(cocktail: e),
            ),
          ),
      (error, stack) {
        GetIt.I<GptClient>()
            .generateRecipe(
              tags,
              ingredients,
            )
            .then(
              (e) => router.pushWidget(
                GeneratedCocktailPreview(cocktail: e),
              ),
            );
      },
    );
  }
}
