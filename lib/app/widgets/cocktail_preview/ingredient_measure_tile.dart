import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/widgets/simple_checkbox.dart';
import 'package:cocktail_gen/domain/entities/ingredient_measure.dart';
import 'package:flutter/material.dart';

class IngredientMeasureTile extends StatelessWidget {
  final IngredientMeasure measure;

  const IngredientMeasureTile({Key? key, required this.measure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SimpleCheckbox(),
        const SizedBox(width: AppPaddings.small),
        Text("${measure.quantity.toStringAsFixed(1)} ml"),
        const SizedBox(width: AppPaddings.small),
        Text(measure.name),
      ],
    );
  }
}
