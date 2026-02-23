// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get settings => 'Ajustes';

  @override
  String get appearance => 'Apariencia';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get language => 'Idioma';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageItalian => 'Italiano';

  @override
  String somethingWentWrong(String error) {
    return 'Algo salió mal: $error';
  }

  @override
  String get retry => 'Reintentar';

  @override
  String get authPage => 'Página de autenticación';

  @override
  String loggedInWithToken(String token) {
    return 'Sesión iniciada con token: $token';
  }

  @override
  String get notLoggedIn => 'No ha iniciado sesión';

  @override
  String errorMessage(String error) {
    return 'Error: $error';
  }

  @override
  String get subscriptions => 'Suscripciones';

  @override
  String get analytics => 'Análisis';

  @override
  String get profile => 'Perfil';
}
