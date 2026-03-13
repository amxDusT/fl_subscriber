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

  @override
  String get addSubscription => 'Aggiungi Abbonamento';

  @override
  String get noSubscriptionsYet => 'Nessun abbonamento';

  @override
  String get noSubscriptionsDescription =>
      'Aggiungi il tuo primo abbonamento per iniziare a monitorare le spese';

  @override
  String get selectService => 'Seleziona un Servizio';

  @override
  String get custom => 'Personalizzato';

  @override
  String get customName => 'Nome';

  @override
  String get choosePlan => 'Scegli un Piano';

  @override
  String get orEnterCustomAmount => 'Oppure Inserisci un Importo';

  @override
  String get amount => 'Importo';

  @override
  String get billingFrequency => 'Frequenza di Pagamento';

  @override
  String get monthly => 'Mensile';

  @override
  String get quarterly => 'Ogni 3 Mesi';

  @override
  String get semiannual => 'Ogni 6 Mesi';

  @override
  String get yearly => 'Annuale';

  @override
  String get startDate => 'Data di Inizio';

  @override
  String get paymentAlerts => 'Avvisi di Pagamento';

  @override
  String get alertOneDayBefore => '1 giorno prima';

  @override
  String get alertThreeDaysBefore => '3 giorni prima';

  @override
  String get alertSevenDaysBefore => '7 giorni prima';

  @override
  String get noAlerts => 'Nessun avviso';

  @override
  String get continueLabel => 'Continua';

  @override
  String get back => 'Indietro';

  @override
  String get finish => 'Conferma';

  @override
  String get nextPayment => 'Prossimo pagamento';

  @override
  String get perMonth => '/mese';

  @override
  String get perYear => '/anno';

  @override
  String get chooseIcon => 'Scegli Icona';

  @override
  String get chooseCategory => 'Scegli Categoria';

  @override
  String get chooseColor => 'Scegli Colore';

  @override
  String get enterAmount => 'Inserisci l\'importo';

  @override
  String get paymentReminder => 'Promemoria Pagamento';

  @override
  String paymentReminderBody(String serviceName, String amount, String days) {
    return 'Il pagamento di $serviceName di $amount scade tra $days giorni';
  }

  @override
  String get deleteService => 'Eliminare Servizio?';

  @override
  String deleteServiceConfirmation(String name) {
    return '$name verrà rimosso dal tuo catalogo.';
  }

  @override
  String get delete => 'Elimina';

  @override
  String get cancel => 'Annulla';

  @override
  String get alert => 'Avviso';

  @override
  String alertDaysBefore(String days) {
    return '${days}g prima';
  }

  @override
  String get alertOff => 'Disattivato';

  @override
  String get category => 'Categoria';

  @override
  String get renewals => 'Rinnovi';

  @override
  String get categoryEntertainment => 'Intrattenimento';

  @override
  String get categoryProductivity => 'Produttività';

  @override
  String get categoryCloud => 'Archiviazione Cloud';

  @override
  String get categoryAi => 'Strumenti IA';

  @override
  String get categoryDesign => 'Design';

  @override
  String get categoryDevelopment => 'Sviluppo';

  @override
  String get categorySocial => 'Social';

  @override
  String get categoryShopping => 'Shopping';

  @override
  String get categoryFitness => 'Fitness';

  @override
  String get categoryEducation => 'Istruzione';

  @override
  String get categoryGaming => 'Videogiochi';

  @override
  String get categoryNews => 'Notizie';

  @override
  String get categoryFinance => 'Finanza';

  @override
  String get categoryLifestyle => 'Stile di Vita';

  @override
  String get categoryOther => 'Altro';

  @override
  String get activeSubscriptions => 'Attivi';

  @override
  String get expiredSubscriptions => 'Scaduti';

  @override
  String get expired => 'Scaduto';

  @override
  String get endDate => 'Data di cancellazione';

  @override
  String get openUnsubscribePage => 'Apri pagina di cancellazione';

  @override
  String get didYouUnsubscribe => 'Ti sei cancellato?';

  @override
  String didYouUnsubscribeMessage(String serviceName) {
    return 'Hai completato la cancellazione di $serviceName?';
  }

  @override
  String get yes => 'Sì';

  @override
  String get no => 'No';

  @override
  String get restoreSubscription => 'Ripristina Abbonamento';

  @override
  String get noExpiredSubscriptions => 'Nessun abbonamento scaduto';

  @override
  String get noExpiredSubscriptionsDescription =>
      'Gli abbonamenti cancellati appariranno qui';

  @override
  String get periodThreeMonths => '3M';

  @override
  String get periodSixMonths => '6M';

  @override
  String get periodOneYear => '1A';

  @override
  String get periodAllTime => 'Tutto';

  @override
  String get monthlyCost => 'Costo Mensile';

  @override
  String get yearlyProjected => 'Proiezione Annuale';

  @override
  String get activeCount => 'Attivi';

  @override
  String get averagePerSub => 'Media / Abb';

  @override
  String get spendingByCategory => 'Spesa per Categoria';

  @override
  String get monthlyTrend => 'Tendenza Mensile';

  @override
  String get breakdown => 'Dettaglio';

  @override
  String get noAnalyticsData => 'Nessun dato';

  @override
  String get noAnalyticsDataDescription =>
      'Aggiungi abbonamenti per vedere le statistiche di spesa';

  @override
  String get noDataForPeriod => 'Nessun dato per questo periodo';

  @override
  String get noDataForPeriodDescription =>
      'Nessun abbonamento era attivo durante questo periodo';

  @override
  String get perMonthAbbr => '/mese';

  @override
  String ofTotal(String percentage) {
    return '$percentage% del totale';
  }

  @override
  String get hapticFeedback => 'Vibrazione';

  @override
  String get websiteLink => 'Sito Web / Link di Cancellazione';

  @override
  String get urlHint => 'https://...';

  @override
  String toastSubscriptionAdded(String serviceName) {
    return '$serviceName aggiunto';
  }

  @override
  String toastSubscriptionCancelled(String serviceName) {
    return '$serviceName cancellato';
  }

  @override
  String toastSubscriptionRestored(String serviceName) {
    return '$serviceName ripristinato';
  }
}
