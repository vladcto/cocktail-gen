import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/domain/entities/tag.dart';
import 'package:flutter/material.dart';

// Chip отображающий имя тега.
class TagChip extends StatelessWidget {
  final Tag tag;
  const TagChip({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: colorScheme.secondaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          tag.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorScheme.secondary,
            fontSize: AppFontSize.small,
          ),
        ),
      ),
    );
  }
}
