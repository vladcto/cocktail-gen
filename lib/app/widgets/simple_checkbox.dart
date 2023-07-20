import 'package:flutter/material.dart';

/// [Checkbox] которые можно переключать, но не отслеживать. 
class SimpleCheckbox extends StatefulWidget {
  const SimpleCheckbox({Key? key}) : super(key: key);

  @override
  State<SimpleCheckbox> createState() => _SimpleCheckboxState();
}

class _SimpleCheckboxState extends State<SimpleCheckbox> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checked,
      onChanged: (_) => setState(() => checked = !checked),
    );
  }
}
