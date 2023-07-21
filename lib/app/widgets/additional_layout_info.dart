import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/widgets/sub_route_app_bar.dart';
import 'package:flutter/material.dart';

import '../constants/app_radius.dart';

/// Разметка для дочернего маршрута.
/// Отображает изображение [imageUrl] и прокручивающийся виджет [child].
class AdditionalLayoutInfo extends StatelessWidget {
  static const double imagePadding = 32;

  final String appBarText;
  final String imageUrl;
  final Widget child;

  /// Перемещает ли кнопка навигации в [AppBar] назад по URL, иначе по стеку навигации.
  final bool isUrlButton;

  const AdditionalLayoutInfo({
    Key? key,
    required this.appBarText,
    required this.imageUrl,
    required this.child,
    this.isUrlButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: SubRouteAppBar(
        title: appBarText,
        backButton: isUrlButton
            ? SubRouteAppBar.backButton
            : ElevatedButton(
                onPressed: () => context.popRoute(),
                child: const Text("Назад"),
              ),
      ),
      body: Stack(
        children: [
          // Делаем изображение квадратным.
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenWidth,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
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
                  ),
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
