import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ThemeShimmer extends StatelessWidget {
  const ThemeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Shimmer.fromColors(
      baseColor: colorScheme.background,
      highlightColor: colorScheme.surfaceVariant,
      child: const ColoredBox(color: Colors.black),
    );
  }
}
