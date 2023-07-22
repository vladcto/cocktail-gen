import 'package:auto_route/auto_route.dart';
import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/constants/app_radius.dart';
import 'package:cocktail_gen/app/widgets/tag_chip.dart';
import 'package:cocktail_gen/app/widgets/theme_shimmer.dart';
import 'package:cocktail_gen/domain/entities/cocktail.dart';
import 'package:cocktail_gen/domain/entities/tag.dart';
import 'package:flutter/material.dart';

/// Карточка, отображающая краткую информацию о [Cocktail].
///
/// Отображает картинку, имя, 4 ингредиента и список тегов.
class CocktailCard extends StatelessWidget {
  static const heroPrefix = "cocktail-";
  final Cocktail cocktail;
  const CocktailCard({Key? key, required this.cocktail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.pushNamed(
        "${context.router.currentUrl}/${cocktail.id}",
      ),
      child: Card(
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
                    // Картинка рецепта.
                    Hero(
                      tag: "$heroPrefix${cocktail.id}",
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: AppRadius.large,
                          child: Image.network(
                            cocktail.imageUrl,
                            fit: BoxFit.cover,
                            loadingBuilder: (_, child, event) {
                              if (event == null) return child;
                              return const ThemeShimmer();
                            },
                            errorBuilder: (_, __, ___) => const ThemeShimmer(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppPaddings.large),
                    Expanded(
                      child: _CocktailShortInfo(cocktail: cocktail),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppPaddings.small),
              SizedBox(
                height: 24,
                child: _TagList(tags: cocktail.tags),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Отображает имя и список ингредиентов коктейля.
class _CocktailShortInfo extends StatelessWidget {
  final Cocktail cocktail;

  const _CocktailShortInfo({required this.cocktail});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final ingredientsText =
        cocktail.ingredients.map((e) => " • ${e.name}").join("\n");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Имя коктейля.
        Text(
          cocktail.name,
          style: TextStyle(
            letterSpacing: 1.2,
            color: colorScheme.secondary,
            fontSize: AppFontSize.header,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Список ингредиентов коктейля.
        Expanded(
          // FIXME: Исправть обрывание текста. [elipsis] не обрезает по строке.
          child: Text(
            ingredientsText,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: AppFontSize.small,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

/// [ListView] отображающий [Tag] с помощью [TagChip].
class _TagList extends StatelessWidget {
  final List<Tag> tags;

  const _TagList({required this.tags});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (context, index) => Center(
          child: TagChip(
            tag: tags[index],
          ),
        ),
        separatorBuilder: (context, i) =>
            const SizedBox(width: AppPaddings.small),
      ),
    );
  }
}
