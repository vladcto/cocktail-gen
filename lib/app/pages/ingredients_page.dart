import 'package:auto_route/annotations.dart';
import 'package:cocktail_gen/app/widgets/ingredient_tile.dart';
import 'package:cocktail_gen/data/repos/mock_ingredient.dart';
import 'package:flutter/material.dart';

@RoutePage()
class IngredientsPage extends StatelessWidget {
  const IngredientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final ingredient in MockIngredient.data)
          SizedBox(
            height: 96,
            child: IngredientTile(ingredient: ingredient),
          ),
      ],
    );
  }
}
