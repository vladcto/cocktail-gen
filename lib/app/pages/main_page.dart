import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/constants/app_shadows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends ConsumerWidget {
  static const generateText = "Generate";
  static const cocktailsText = "Cocktails";
  static const ingredientsText = "Ingredients";

  static final _selectedProvider = StateProvider((ref) => 0);

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      bottomNavigationBar: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            AppShadows.bottomTop,
          ],
        ),
        child: SalomonBottomBar(
          margin: EdgeInsets.symmetric(
            vertical: AppPaddings.small,
            horizontal: AppPaddings.veryLarge,
          ),
          currentIndex: ref.watch(_selectedProvider),
          backgroundColor: colorScheme.surface,
          items: [
            SalomonBottomBarItem(
              icon: Icon(MdiIcons.lamp),
              title: const Text(generateText),
            ),
            SalomonBottomBarItem(
              icon: Icon(MdiIcons.glassCocktail),
              title: const Text(cocktailsText),
            ),
            SalomonBottomBarItem(
              icon: Icon(MdiIcons.store),
              title: const Text(ingredientsText),
            ),
          ],
          onTap: (i) => ref.read(_selectedProvider.notifier).state = i,
        ),
      ),
      appBar: AppBar(
        title: const Center(
          // TODO: Изменить текст.
          child: Text("Some text"),
        ),
      ),
    );
  }
}
