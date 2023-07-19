import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/constants/app_radius.dart';
import 'package:cocktail_gen/domain/entities/cocktail.dart';
import 'package:cocktail_gen/domain/entities/tag.dart';
import 'package:flutter/material.dart';

class CocktailCard extends StatelessWidget {
  final Cocktail cocktail;
  const CocktailCard({Key? key, required this.cocktail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.small,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPaddings.medium,
          vertical: AppPaddings.small,
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: AppRadius.large,
                      child: Image.network(
                        cocktail.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: _CocktailShortInfo(cocktail: cocktail),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppPaddings.small),
            SizedBox(
              height: 32,
              child: _TagList(tags: cocktail.tags),
            )
          ],
        ),
      ),
    );
  }
}

class _CocktailShortInfo extends StatelessWidget {
  final Cocktail cocktail;

  const _CocktailShortInfo({required this.cocktail});

  @override
  Widget build(BuildContext context) {
    var text = cocktail.ingredients.map((e) => " • ${e.name}").join("\n");

    return Column(
      children: [
        Text(cocktail.name),
        Expanded(
          // FIXME: Исправть обрывание текста. [elipsis] не обрезает по строке.
          child: Text(
            text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _TagList extends StatelessWidget {
  final List<Tag> tags;

  const _TagList({required this.tags});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (final tag in tags)
          Chip(
            label: Text(tag.name),
          ),
      ],
    );
  }
}
