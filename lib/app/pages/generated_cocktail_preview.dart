import 'package:cocktail_gen/app/widgets/cocktail_preview/cocktail_preview_layout.dart';
import 'package:cocktail_gen/domain/entities/cocktail.dart';
import 'package:flutter/material.dart';

class GeneratedCocktailPreview extends StatelessWidget {
  final Cocktail cocktail;

  const GeneratedCocktailPreview({Key? key, required this.cocktail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CocktailPreviewLayout(
      cocktail: cocktail,
    );
  }
}
