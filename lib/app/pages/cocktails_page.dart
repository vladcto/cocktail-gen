import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CocktailsPage extends StatelessWidget {
  const CocktailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const Placeholder(
        color: Colors.orange,
      ),
    );
  }
}
