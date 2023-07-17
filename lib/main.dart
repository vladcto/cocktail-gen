import 'package:cocktail_gen/app/constants/app_theme.dart';
import 'package:cocktail_gen/app/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: AppTheme.dark,
        home: const MainPage(),
      ),
    );
  }
}
