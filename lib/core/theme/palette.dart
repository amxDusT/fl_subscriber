import 'package:flutter/material.dart';

class Palette {
  Palette._();

  // ===== Core Brand =====
  static const Color primary = Color(0xFF308CE8);
  static const Color primaryLight = Color(0xFF5CA6EE);
  static const Color primaryDark = Color(0xFF1F6FC2);

  // ===== Backgrounds =====
  static const Color backgroundDark = Color(0xFF111921);
  static const Color backgroundLight = Color(0xFFF6F7F8);

  // ===== Surface (Cards, Containers) =====
  static const Color surfaceDark = Color(0xFF1B2530); // slate-800 vibe
  static const Color surfaceDarkSoft = Color(0xFF22303D); // elevated cards
  static const Color surfaceLight = Colors.white;

  // ===== Borders =====
  static const Color borderDark = Color(0xFF2A3542);
  static const Color borderLight = Color(0xFFE2E8F0);

  // ===== Text - Dark Mode =====
  static const Color textPrimaryDark = Color(0xFFF1F5F9); // near slate-100
  static const Color textSecondaryDark = Color(0xFF94A3B8); // slate-400
  static const Color textMutedDark = Color(0xFF64748B); // slate-500

  // ===== Text - Light Mode =====
  static const Color textPrimaryLight = Color(0xFF0F172A); // slate-900
  static const Color textSecondaryLight = Color(0xFF475569);

  // ===== Status Colors =====
  static const Color success = Color(0xFF22C55E); // green-500
  static const Color warning = Color(0xFFF59E0B); // orange-500
  static const Color error = Color(0xFFEF4444); // red-500
  static const Color info = primary;

  // ===== Overlays / Effects =====
  static const Color blurOverlayDark = Color(0xCC111921); // 80% opacity
  static const Color glowPrimary = Color(0x80308CE8); // 50% alpha
}
