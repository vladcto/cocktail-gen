import 'package:auto_route/annotations.dart';
import 'package:cocktail_gen/app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class GeneratorPage extends ConsumerWidget {
  const GeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                (value) => print(value),
              );
        },
        child: Text("Press me"),
      ),
    );
  }
}
