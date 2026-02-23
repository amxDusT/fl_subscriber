// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get settings => 'Impostazioni';

  @override
  String get appearance => 'Aspetto';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get language => 'Lingua';

  @override
  String get languageEnglish => 'Inglese';

  @override
  String get languageSpanish => 'Spagnolo';

  @override
  String get languageItalian => 'Italiano';

  @override
  String somethingWentWrong(String error) {
    return 'Qualcosa è andato storto: $error';
  }

  @override
  String get retry => 'Riprova';

  @override
  String get authPage => 'Pagina di autenticazione';

  @override
  String loggedInWithToken(String token) {
    return 'Accesso effettuato con token: $token';
  }

  @override
  String get notLoggedIn => 'Non connesso';

  @override
  String errorMessage(String error) {
    return 'Errore: $error';
  }

  @override
  String get subscriptions => 'Abbonamenti';

  @override
  String get analytics => 'Analisi';

  @override
  String get profile => 'Profilo';
}
