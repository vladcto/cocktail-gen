import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/navigation/navigation_url.dart';
import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  static const cocktailParam = "cocktailId";
  static const ingredientParam = "ingredientId";

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          path: "/",
          children: [
            AutoRoute(
              page: CocktailsRoute.page,
              path: NavigationUrl.cocktail,
            ),
            AutoRoute(
              page: GeneratorRoute.page,
              path: NavigationUrl.generate,
            ),
            AutoRoute(
              page: IngredientsRoute.page,
              path: NavigationUrl.ingredients,
            ),
          ],
        ),
        AutoRoute(
          page: CocktailPreviewRoute.page,
          path: "/${NavigationUrl.cocktail}/:$cocktailParam",
        ),
        AutoRoute(
          page: IngredientPreviewRoute.page,
          path: "/${NavigationUrl.ingredients}/:$ingredientParam",
        ),
        RedirectRoute(path: "*", redirectTo: "/${NavigationUrl.cocktail}"),
      ];
}
