import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/constants/app_shadows.dart';
import 'package:cocktail_gen/app/navigation/router.gr.dart';
import 'package:cocktail_gen/app/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  static const generateText = "Магия";
  static const cocktailsText = "Коктейли";
  static const ingredientsText = "Ингредиенты";

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return AutoTabsRouter.pageView(
      routes: const [
        GeneratorRoute(),
        CocktailsRoute(),
        IngredientsRoute(),
      ],
      builder: (ctx, child, controller) {
        final tabsRouter = AutoTabsRouter.of(ctx);

        return Scaffold(
          bottomNavigationBar: DecoratedBox(
            decoration: const BoxDecoration(
              boxShadow: [
                AppShadows.bottomTop,
              ],
            ),
            child: SalomonBottomBar(
              margin: const EdgeInsets.symmetric(
                vertical: AppPaddings.small,
                horizontal: AppPaddings.veryLarge,
              ),
              currentIndex: tabsRouter.activeIndex,
              backgroundColor: colorScheme.surface,
              items: [
                SalomonBottomBarItem(
                  icon: Icon(MdiIcons.creation),
                  title: const Text(generateText),
                ),
                SalomonBottomBarItem(
                  icon: Icon(MdiIcons.glassCocktail),
                  title: const Text(cocktailsText),
                ),
                SalomonBottomBarItem(
                  icon: Icon(MdiIcons.book),
                  title: const Text(ingredientsText),
                ),
              ],
              onTap: tabsRouter.setActiveIndex,
            ),
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => context.router.pushWidget(
                  const SettingsPage(),
                ),
                icon: const Icon(Icons.settings),
              ),
            ],
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cocktail",
                    style: TextStyle(
                      color: colorScheme.secondary,
                    ),
                  ),
                  Text(
                    "Gen",
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: child,
        );
      },
    );
  }
}
