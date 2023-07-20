import 'package:cocktail_gen/app/widgets/cocktail_preview/ingredient_measure_tile.dart';
import 'package:cocktail_gen/domain/entities/ingredient_measure.dart';
import 'package:flutter/material.dart';

class IngredientsPreview extends StatelessWidget {
  final List<IngredientMeasure> ingredients;

  const IngredientsPreview({Key? key, required this.ingredients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ingredients
          .map(
            (e) => IngredientMeasureTile(measure: e),
          )
          .toList(),
    );
  }
}
