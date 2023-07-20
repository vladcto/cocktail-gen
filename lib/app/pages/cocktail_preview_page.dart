import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/widgets/additional_layout_info.dart';
import 'package:cocktail_gen/domain/entities/cocktail.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CocktailPreviewPage extends StatelessWidget {
  final Cocktail cocktail;
  const CocktailPreviewPage({
    Key? key,
    required this.cocktail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalLayoutInfo(
      appBarText: cocktail.name,
      imageUrl: cocktail.imageUrl,
      child: const SizedBox.shrink(),
    );
  }
}
