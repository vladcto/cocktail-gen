import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class IngredientsPage extends StatelessWidget {
  const IngredientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const Placeholder(
        color: Colors.green,
      ),
    );
  }
}
