import 'package:flutter/material.dart';

sealed class AppShadows {
  static const Color shadowColor = Colors.black26;

  static const BoxShadow bottomTop = BoxShadow(
    color: shadowColor,
    blurRadius: 4,
    offset: Offset(0, -4),
  );

  static const BoxShadow topBottom = BoxShadow(
    color: shadowColor,
    blurRadius: 4,
    offset: Offset(0, 4),
  );
}
