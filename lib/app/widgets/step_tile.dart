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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(index.toString()),
        Flexible(
          fit: FlexFit.loose,
          child: Text(text),
        ),
      ],
    );
  }
}
