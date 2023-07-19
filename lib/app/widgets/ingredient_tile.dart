import 'package:cocktail_gen/app/constants/app_radius.dart';
import 'package:cocktail_gen/domain/entities/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientTile extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientTile({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: AppRadius.standard,
            child: Image.network(ingredient.imageUrl),
          ),
        ),
        Expanded(
          child: Text(ingredient.name),
        ),
      ],
    );
  }
}
