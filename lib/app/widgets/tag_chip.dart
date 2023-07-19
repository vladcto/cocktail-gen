import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/domain/entities/tag.dart';
import 'package:flutter/material.dart';

// Chip отображающий имя тега.
class TagChip extends StatelessWidget {
  final Tag tag;
  const TagChip({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: colorScheme.secondaryContainer,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: AppPaddings.small),
      child: Text(
        tag.name,
        style: TextStyle(
          color: colorScheme.secondary,
          fontSize: AppFontSize.small,
        ),
      ),
    );
  }
}
