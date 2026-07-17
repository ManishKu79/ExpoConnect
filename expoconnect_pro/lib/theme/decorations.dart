import 'package:flutter/material.dart';
import 'colors.dart';

class AppDecorations {
  
  static const double radiusNone = 0;
  static const double radiusSM = 4.0;
  static const double radiusMD = 8.0;
  static const double radiusLG = 12.0;
  static const double radiusXL = 16.0;
  static const double radiusXXL = 20.0;
  static const double radiusFull = 100.0;
  
  
  static List<BoxShadow> shadowNone = [];
  
  static List<BoxShadow> shadowSM = [
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 4,
      offset: const Offset(0, 2),
      spreadRadius: 0,
    ),
  ];
  
  static List<BoxShadow> shadowMD = [
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 8,
      offset: const Offset(0, 4),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 4,
      offset: const Offset(0, 2),
      spreadRadius: -2,
    ),
  ];
  
  static List<BoxShadow> shadowLG = [
    BoxShadow(
      color: AppColors.shadowMedium,
      blurRadius: 16,
      offset: const Offset(0, 6),
      spreadRadius: -2,
    ),
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 8,
      offset: const Offset(0, 4),
      spreadRadius: -4,
    ),
  ];
  
  static List<BoxShadow> shadowXL = [
    BoxShadow(
      color: AppColors.shadowMedium,
      blurRadius: 24,
      offset: const Offset(0, 8),
      spreadRadius: -4,
    ),
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 12,
      offset: const Offset(0, 6),
      spreadRadius: -6,
    ),
  ];
  
  static List<BoxShadow> shadowXXL = [
    BoxShadow(
      color: AppColors.shadowDark,
      blurRadius: 40,
      offset: const Offset(0, 12),
      spreadRadius: -8,
    ),
    BoxShadow(
      color: AppColors.shadowMedium,
      blurRadius: 16,
      offset: const Offset(0, 8),
      spreadRadius: -10,
    ),
  ];
  
  
  static BoxDecoration cardDecorationLight = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(radiusLG),
    boxShadow: shadowMD,
    border: Border.all(
      color: AppColors.borderLight,
      width: 1,
    ),
  );
  
  static BoxDecoration cardDecorationDark = BoxDecoration(
    color: AppColors.darkSurface,
    borderRadius: BorderRadius.circular(radiusLG),
    boxShadow: shadowMD,
    border: Border.all(
      color: AppColors.darkBorder,
      width: 1,
    ),
  );
  
  static BoxDecoration gradientCardDecoration = BoxDecoration(
    gradient: AppColors.primaryGradient,
    borderRadius: BorderRadius.circular(radiusLG),
    boxShadow: shadowLG,
  );
  
  static BoxDecoration imageContainerDecoration = BoxDecoration(
    color: AppColors.surfaceVariant,
    borderRadius: BorderRadius.circular(radiusMD),
    border: Border.all(
      color: AppColors.borderLight,
      width: 1,
    ),
  );
  
  // Input decoration
  static InputDecorationTheme inputDecorationTheme = const InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surfaceVariant,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: AppColors.border),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: AppColors.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: AppColors.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: AppColors.error, width: 2),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    isDense: true,
  );
}
