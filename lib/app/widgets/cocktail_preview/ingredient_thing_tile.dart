import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/widgets/simple_checkbox.dart';
import 'package:cocktail_gen/domain/entities/ingredient_thing.dart';
import 'package:flutter/material.dart';

class IngredientThingTile extends StatelessWidget {
  static const FontWeight _fontWeight = FontWeight.w500;
  static const double _fontSize = AppFontSize.medium;
  final IngredientThing thing;

  const IngredientThingTile({Key? key, required this.thing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        const SimpleCheckbox(),
        const SizedBox(width: AppPaddings.small),
        Expanded(
          child: Text(
            thing.name,
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
