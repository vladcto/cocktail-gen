import 'package:cocktail_gen/app/widgets/step_tile.dart';
import 'package:flutter/material.dart';

class StepsPreview extends StatelessWidget {
  final List<String> steps;

  const StepsPreview({Key? key, required this.steps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stepTiles = List.generate(
      steps.length,
      (i) => Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
          ),
          child: StepTile(index: i + 1, text: steps[i])),
    );

    return Column(
      children: stepTiles,
    );
  }
}
