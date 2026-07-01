import 'package:flutter/material.dart';

class AppColors {
  // Primary - Deep Indigo (Trust, Professionalism, Luxury)
  static const Color primary = Color(0xFF1A0F3A);
  static const Color primaryLight = Color(0xFF3A2A6A);
  static const Color primaryDark = Color(0xFF0A0520);
  
  // Secondary - Soft Gold (Premium, Warmth, Value)
  static const Color secondary = Color(0xFFE8C97A);
  static const Color secondaryLight = Color(0xFFF5E6C8);
  static const Color secondaryDark = Color(0xFFC4A45A);
  
  // Accent - Vibrant Coral (Energy, Action, Excitement)
  static const Color accent = Color(0xFFFF6B6B);
  static const Color accentLight = Color(0xFFFFA8A8);
  static const Color accentDark = Color(0xFFE53E3E);
  
  // Tertiary - Teal (Modern, Trust, Calm)
  static const Color tertiary = Color(0xFF2EC4B6);
  static const Color tertiaryLight = Color(0xFF7DE2D6);
  
  // Gradients
  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFF1A0F3A), Color(0xFF3A2A6A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient premiumGradient = LinearGradient(
    colors: [Color(0xFFE8C97A), Color(0xFFFF6B6B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1A0F3A), Color(0xFF3A2A6A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient modernGradient = LinearGradient(
    colors: [Color(0xFF2EC4B6), Color(0xFF1A0F3A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // UI Colors
  static const Color background = Color(0xFFF8F6F3);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceAlt = Color(0xFFF0EDE8);
  static const Color cardBg = Color(0xFFFFFFFF);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF1A0F3A);
  static const Color textSecondary = Color(0xFF6B5B7A);
  static const Color textTertiary = Color(0xFF9B8BA8);
  static const Color textInverse = Color(0xFFFFFFFF);
  static const Color textGold = Color(0xFFE8C97A);
  
  // Semantic Colors
  static const Color success = Color(0xFF2ECC71);
  static const Color successBg = Color(0xFFEAFAF1);
  static const Color error = Color(0xFFE74C3C);
  static const Color errorBg = Color(0xFFFDEDEC);
  static const Color warning = Color(0xFFF39C12);
  static const Color warningBg = Color(0xFFFEF9E7);
  static const Color info = Color(0xFF3498DB);
  static const Color infoBg = Color(0xFFEBF5FB);
  
  // Borders
  static const Color border = Color(0xFFE5E0DA);
  static const Color borderLight = Color(0xFFF0EDE8);
  static const Color borderFocus = Color(0xFFE8C97A);
  static const Color darkBorder = Color(0xFF2A2245);
  
  // Shadows
  static const Color shadowLight = Color(0x0D1A0F3A);
  static const Color shadowMedium = Color(0x1A1A0F3A);
  static const Color shadowDark = Color(0x331A0F3A);
  static const Color shadowGold = Color(0x33E8C97A);
  
  // Dark Theme
  static const Color darkBackground = Color(0xFF0D0A1A);
  static const Color darkSurface = Color(0xFF1A1430);
  static const Color darkSurfaceAlt = Color(0xFF2A2245);
  static const Color darkCardBg = Color(0xFF1F1938);
  static const Color darkTextPrimary = Color(0xFFF5F0FF);
  static const Color darkTextSecondary = Color(0xFFB5A8C8);
  static const Color darkTextTertiary = Color(0xFF7A6A90);
}