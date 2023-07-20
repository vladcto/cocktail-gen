import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/widgets/simple_checkbox.dart';
import 'package:cocktail_gen/domain/entities/ingredient_measure.dart';
import 'package:flutter/material.dart';

class IngredientMeasureTile extends StatelessWidget {
  static const FontWeight _fontWeight = FontWeight.w500;
  static const double _fontSize = AppFontSize.medium;

  final IngredientMeasure measure;

  const IngredientMeasureTile({Key? key, required this.measure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        const SimpleCheckbox(),
        const SizedBox(width: AppPaddings.small),
        SizedBox(
          width: 64,
          child: Text(
            "${measure.quantity.toStringAsFixed(1)} ml",
            style: TextStyle(
              color: colorScheme.onSurfaceVariant,
              fontWeight: _fontWeight,
              fontSize: _fontSize,
            ),
          ),
        ),
        const SizedBox(width: AppPaddings.small),
        Expanded(
          child: Text(
            measure.name,
            style: TextStyle(
              color: colorScheme.secondary,
              fontWeight: _fontWeight,
              fontSize: _fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
