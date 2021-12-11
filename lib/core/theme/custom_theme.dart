import 'package:elevenia_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
class CustomTheme {
  final ThemeData light = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    backgroundColor: AppColors.backgroundLight,
    dividerColor: Colors.white54,
  );

  final ThemeData dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    backgroundColor: AppColors.backgroundDark,
    dividerColor: Colors.black12,
  );
}
