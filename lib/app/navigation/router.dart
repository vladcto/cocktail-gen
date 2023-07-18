import 'package:auto_route/auto_route.dart';
import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true, children: [
          AutoRoute(page: CocktailsRoute.page),
          AutoRoute(page: GeneratorRoute.page),
          AutoRoute(page: IngredientsRoute.page),
        ]),
      ];
}
