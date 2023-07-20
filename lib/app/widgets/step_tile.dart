
import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:flutter/material.dart';

class StepTile extends StatelessWidget {
  final int index;
  final String text;

  const StepTile({
    super.key,
    required this.index,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          index.toString().padLeft(2, "0"),
          style: TextStyle(
            color: colorScheme.secondary,
            fontSize: AppFontSize.medium,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: AppPaddings.small),
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            text,
            style: TextStyle(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w400,
              fontSize: AppFontSize.medium,
            ),
          ),
        ),
      ],
    );
  }
}
