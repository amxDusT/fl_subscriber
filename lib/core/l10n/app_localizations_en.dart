// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get settings => 'Settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get language => 'Language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Spanish';

  @override
  String get languageItalian => 'Italian';

  @override
  String somethingWentWrong(String error) {
    return 'Something went wrong: $error';
  }

  @override
  String get retry => 'Retry';

  @override
  String get authPage => 'Auth Page';

  @override
  String loggedInWithToken(String token) {
    return 'Logged in with token: $token';
  }

  @override
  String get notLoggedIn => 'Not logged in';

  @override
  String errorMessage(String error) {
    return 'Error: $error';
  }
}
