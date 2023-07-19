import 'package:auto_route/annotations.dart';
import 'package:cocktail_gen/app/widgets/cocktail_card.dart';
import 'package:cocktail_gen/data/repos/mock_cocktail.dart';
import 'package:flutter/material.dart';

/// Страница, отображающая список всех коктейлей.
@RoutePage()
class CocktailsPage extends StatelessWidget {
  const CocktailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        for (final cocktail in MockCocktail.data)
          SizedBox(
            height: 168,
            child: CocktailCard(cocktail: cocktail),
          ),
      ],
    );
  }
}
