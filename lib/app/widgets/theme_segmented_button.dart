import 'package:flutter/material.dart';

/// Виджет - стилизованный [SegmentedButton] с единственным выбором.
class ThemeSegmentedButton<T> extends StatefulWidget {
  final List<ButtonSegment<T>> segments;
  final T initial;
  final void Function(T) onSelected;

  const ThemeSegmentedButton({
    super.key,
    required this.segments,
    required this.onSelected,
    required this.initial,
  });

  @override
  State<ThemeSegmentedButton<T>> createState() =>
      _ThemeSegmentedButtonState<T>();
}

class _ThemeSegmentedButtonState<T> extends State<ThemeSegmentedButton<T>> {
  late T _selected;

  @override
  void initState() {
    _selected = widget.initial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return SegmentedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) => switch (states.firstOrNull) {
            MaterialState.selected => colorScheme.primary,
            _ => Colors.transparent,
          },
        ),
        side: MaterialStateProperty.all(
          BorderSide(color: colorScheme.primary),
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        foregroundColor: MaterialStateProperty.resolveWith(
          (state) => state.firstOrNull == MaterialState.selected
              ? colorScheme.onPrimary
              : colorScheme.primary,
        ),
      ),
      showSelectedIcon: false,
      segments: widget.segments,
      selected: {_selected},
      onSelectionChanged: (selected) {
        setState(() => _selected = selected.first);
        widget.onSelected(_selected);
      },
    );
  }
}
