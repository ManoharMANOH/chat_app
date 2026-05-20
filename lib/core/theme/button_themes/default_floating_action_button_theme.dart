import 'package:chat_app/core/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultFloatingActionButtonTheme {
  static FloatingActionButtonThemeData theme(ColorScheme scheme) {
    return FloatingActionButtonThemeData(
      backgroundColor: scheme.primary,
      foregroundColor: scheme.onPrimary,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(AppSizes.borderRadiusMd),
      ),
      extendedTextStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: scheme.onPrimary,
      ),
    );
  }
}
