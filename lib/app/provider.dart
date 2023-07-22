import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import 'constants/app_theme.dart';

final themeProvider = StateProvider<ThemeData>(
  (ref) => AppTheme.dark,
);
