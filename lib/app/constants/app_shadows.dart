import 'package:flutter/material.dart';

sealed class AppShadows {
  static const Color shadowColor = Colors.black26;

  static const BoxShadow bottomToTop = BoxShadow(
    color: shadowColor,
    blurRadius: 4,
    offset: Offset(0, -4),
  );
}
