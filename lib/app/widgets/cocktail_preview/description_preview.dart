import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/widgets/tag_chip.dart';
import 'package:cocktail_gen/domain/entities/cocktail.dart';
import 'package:flutter/material.dart';

class DescriptionPreview extends StatelessWidget {
  static const _titleFontWeight = FontWeight.w600;
  static const _descriptionFontWeight = FontWeight.w400;

  final Cocktail cocktail;
  const DescriptionPreview({super.key, required this.cocktail});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Нужно ли показывать теги.
        if (cocktail.tags.isNotEmpty) ...[
          Text(
            "Теги",
            style: TextStyle(
              color: colorScheme.primary,
              fontSize: AppFontSize.header,
              fontWeight: _titleFontWeight,
            ),
          ),
          const SizedBox(height: AppPaddings.small),
          Wrap(
            spacing: AppPaddings.small,
            runSpacing: AppPaddings.small,
            children: cocktail.tags
                .map(
                  (e) => TagChip(tag: e),
                )
                .toList(),
          ),
        ],
        const SizedBox(height: AppPaddings.large),
        Text(
          "Ещё немного",
          style: TextStyle(
            color: colorScheme.primary,
            fontSize: AppFontSize.header,
            fontWeight: _titleFontWeight,
          ),
        ),
        const SizedBox(height: AppPaddings.small),
        Text(
          cocktail.description,
          style: TextStyle(
            color: colorScheme.onSurface,
            fontWeight: _descriptionFontWeight,
            fontSize: AppFontSize.medium,
          ),
        ),
      ],
    );
  }
}
