import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/di.dart';
import 'package:cocktail_gen/app/pages/generated_cocktail_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _tagsProvider = StateProvider<String>((_) => "");
final _ingredientsProvider = StateProvider<String>((_) => "");

@RoutePage()
class GeneratorPage extends ConsumerWidget {
  const GeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = context.router;

    return Center(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              label: Text("Теги, через запятую"),
            ),
            onChanged: (val) => ref.read(_tagsProvider.notifier).state = val,
          ),
          TextField(
            decoration: InputDecoration(
              label: Text("Ингредиенты, через запятую"),
            ),
            onChanged: (val) =>
                ref.read(_ingredientsProvider.notifier).state = val,
          ),
          ElevatedButton(
            onPressed: () {
              final tags = ref.read(_tagsProvider);
              final ingredients = ref.read(_ingredientsProvider);
              ref
                  .read(gptClientProvider)
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
            child: Text("Press me"),
          ),
        ],
      ),
    );
  }
}
