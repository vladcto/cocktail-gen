import 'package:cocktail_gen/app/constants/app_paddings.dart';
import 'package:cocktail_gen/app/constants/app_theme.dart';
import 'package:cocktail_gen/app/provider.dart';
import 'package:cocktail_gen/app/widgets/sub_route_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _darkSelectedProvider = StateProvider((ref) => true);

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      _darkSelectedProvider,
      (_, darkTheme) => ref.read(themeProvider.notifier).state =
          darkTheme ? AppTheme.dark : AppTheme.light,
    );

    return Scaffold(
      appBar: SubRouteAppBar(title: "Настройки"),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: ref.watch(_darkSelectedProvider),
              onChanged: (val) =>
                  ref.read(_darkSelectedProvider.notifier).state = val!,
            ),
            const SizedBox(width: AppPaddings.small),
            const Text("Темная тема")
          ],
        ),
      ),
    );
  }
}
