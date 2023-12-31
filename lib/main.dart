import 'dart:ui';

import 'package:cocktail_gen/app/di.dart';
import 'package:cocktail_gen/app/navigation/router.dart';
import 'package:cocktail_gen/app/provider.dart';
import 'package:cocktail_gen/interfaces/db_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  await getIt<RecipeRepository>().init();
  runApp(const MainApp());
}

final appRouter = AppRouter();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (_, ref, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ref.watch(themeProvider),
            scrollBehavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            routerConfig: appRouter.config(),
          );
        },
      ),
    );
  }
}
