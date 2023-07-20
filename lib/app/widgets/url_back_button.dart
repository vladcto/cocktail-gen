import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/utils/url_cutter_extension.dart';
import 'package:flutter/material.dart';

/// Кнопка, которая переключает навигацию на предыдущий URL (до последнего "/").
class UrlBackButton extends StatelessWidget {
  const UrlBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.abc),
      onPressed: () {
        final router = context.router;
        // Сохраняем URL *ДО* того, как уберем текущую страницу.
        final prevUrl = router.currentUrl.prevUrl;
        // Чтобы не держать в стеке убранную страницу.
        router.removeLast();
        router.navigateNamed(prevUrl);
      },
    );
  }
}
