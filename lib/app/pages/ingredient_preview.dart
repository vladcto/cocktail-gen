import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/widgets/url_back_button.dart';
import 'package:cocktail_gen/data/repos/mock_ingredient.dart';
import 'package:flutter/material.dart';

@RoutePage()
class IngredientPreviewPage extends StatelessWidget {
  const IngredientPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ingredient = MockIngredient.ingredient;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: width,
            automaticallyImplyLeading: true,
            leading: const UrlBackButton(),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                ingredient.imageUrl,
                fit: BoxFit.cover,
              ),
              title: Text(
                ingredient.name,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: GestureDetector(
              child: const SizedBox(
                height: 10000,
              ),
            ),
          )
        ],
      ),
    );
  }
}
