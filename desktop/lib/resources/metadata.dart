import 'package:flutter/material.dart';

abstract class AppMetadata {
  static const String appName = "Dive Club";

  static const String developerName = "Idir Yacine";
  static const String developerEmail = "idiryacinesp@gmail.com";

  static const String iconsLabel = "IDIRYACINE";
  static const String developerPhone = "+213540675611";

  static Locale localeEnglish = const Locale('en', '');
  static Locale localeArabic = const Locale('ar', '');
  static Locale localeFrench = const Locale('fr', '');

  static List<Locale> supportedLocales = [
    localeEnglish,
    localeFrench,
    localeArabic
  ];
}
