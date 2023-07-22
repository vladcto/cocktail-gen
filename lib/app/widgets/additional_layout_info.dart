import 'package:cocktail_gen/app/widgets/sub_route_app_bar.dart';
import 'package:cocktail_gen/app/widgets/theme_shimmer.dart';
import 'package:flutter/material.dart';

import '../constants/app_radius.dart';

/// Разметка для дочернего маршрута.
/// Отображает изображение [imageUrl] и прокручивающийся виджет [child].
class AdditionalLayoutInfo extends StatelessWidget {
  static const double imagePadding = 32;
  final String? heroTag;
  final String appBarText;
  final String imageUrl;
  final Widget child;

  const AdditionalLayoutInfo({
    Key? key,
    required this.appBarText,
    required this.imageUrl,
    required this.child,
    this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;

    final image = Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (_, child, event) {
        if (event == null) return child;
        return const ThemeShimmer();
      },
      errorBuilder: (_, __, ___) => const ThemeShimmer(),
    );

    return Scaffold(
      appBar: SubRouteAppBar(
        title: appBarText,
      ),
      body: Stack(
        children: [
          // Делаем изображение квадратным.
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenWidth,
            child: heroTag != null
                ? Hero(
                    tag: heroTag!,
                    child: image,
                  )
                : image,
          ),
          Positioned.fill(
            child: ListView(
              children: [
                // Чтобы подложка немного заехала на изображение.
                SizedBox(height: screenWidth - imagePadding),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: AppRadius.standard,
                      color: colorScheme.background,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, -4),
                          blurRadius: 12,
                          color: Colors.black12,
                        )
                      ]),
                  padding: EdgeInsets.only(
                    // Учитываем шапку контейнера.
                    top: imagePadding,
                    // Делаем список прокручивающимся.
                    bottom: screenWidth,
                  ),
                  child: child,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
