import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/constants/app_radius.dart';
import 'package:cocktail_gen/app/utils/url_cutter_extension.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/// Кнопка, которая возвращает на предыдущий стек навигации.
class ThemeBackButton extends StatelessWidget {
  static const double margin = 6;
  static const double iconSize = 16;
  static const double strokeWidth = 2;

  const ThemeBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(margin),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.standard,
          ),
          side: BorderSide(
            width: strokeWidth,
            color: colorScheme.primary,
          ),
        ),
        onPressed: () {
          final router = context.router;
          if (router.stack.length == 1 && !router.canPop()) {
            // Сохраняем URL *ДО* того, как уберем текущую страницу.
            final prevUrl = router.currentUrl.prevUrl;
            // Чтобы не держать в стеке убранную страницу.
            router.removeLast();
            router.navigateNamed(prevUrl);
          } else {
            router.pop();
          }
        },
        child: Icon(
          MdiIcons.lessThan,
          size: iconSize,
        ),
      ),
    );
  }
}
