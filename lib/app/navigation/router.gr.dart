// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:cocktail_gen/app/pages/cocktails_page.dart' as _i1;
import 'package:cocktail_gen/app/pages/generator_page.dart' as _i2;
import 'package:cocktail_gen/app/pages/ingredients_page.dart' as _i3;
import 'package:cocktail_gen/app/pages/main_page.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    CocktailsRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CocktailsPage(),
      );
    },
    GeneratorRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.GeneratorPage(),
      );
    },
    IngredientsRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.IngredientsPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CocktailsPage]
class CocktailsRoute extends _i5.PageRouteInfo<void> {
  const CocktailsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CocktailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CocktailsRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.GeneratorPage]
class GeneratorRoute extends _i5.PageRouteInfo<void> {
  const GeneratorRoute({List<_i5.PageRouteInfo>? children})
      : super(
          GeneratorRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneratorRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.IngredientsPage]
class IngredientsRoute extends _i5.PageRouteInfo<void> {
  const IngredientsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          IngredientsRoute.name,
          initialChildren: children,
        );

  static const String name = 'IngredientsRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
