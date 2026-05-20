import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_text_styles.dart';
import 'package:chat_app/core/theme/button_themes/default_filled_button_theme.dart';
import 'package:chat_app/core/theme/button_themes/default_floating_action_button_theme.dart';
import 'package:chat_app/core/theme/button_themes/default_outlined_button_theme.dart';
import 'package:chat_app/core/theme/button_themes/default_text_button_theme.dart';
import 'package:chat_app/core/theme/input_themes/form_input_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final _lightScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    brightness: Brightness.light,
  );
  static final _darkScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    brightness: Brightness.dark,
  );

  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightScheme,
    scaffoldBackgroundColor: _lightScheme.surfaceContainerLow,
    textTheme: AppTextStyles.textTheme(_lightScheme),
    filledButtonTheme: DefaultFilledButtonTheme.theme(_lightScheme),
    textButtonTheme: DefaultTextButtonTheme.theme(_lightScheme),
    outlinedButtonTheme: DefaultOutlinedButtonTheme.theme(_lightScheme),
    floatingActionButtonTheme: DefaultFloatingActionButtonTheme.theme(
      _lightScheme,
    ),
    inputDecorationTheme: FormInputTheme.theme(_lightScheme),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _lightScheme.surface,
      selectedItemColor: _lightScheme.primary,
      unselectedItemColor: _lightScheme.onSurfaceVariant,
      type: BottomNavigationBarType.fixed,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _darkScheme,
    scaffoldBackgroundColor: _darkScheme.surfaceContainerLow,
    textTheme: AppTextStyles.textTheme(_darkScheme),
    filledButtonTheme: DefaultFilledButtonTheme.theme(_darkScheme),
    textButtonTheme: DefaultTextButtonTheme.theme(_darkScheme),
    outlinedButtonTheme: DefaultOutlinedButtonTheme.theme(_darkScheme),
    floatingActionButtonTheme: DefaultFloatingActionButtonTheme.theme(
      _darkScheme,
    ),
    inputDecorationTheme: FormInputTheme.theme(_darkScheme),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _darkScheme.surface,
      selectedItemColor: _darkScheme.primary,
      unselectedItemColor: _darkScheme.onSurfaceVariant,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
