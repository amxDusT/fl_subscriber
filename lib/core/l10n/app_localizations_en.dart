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

  @override
  String get subscriptions => 'Subscriptions';

  @override
  String get analytics => 'Analytics';

  @override
  String get profile => 'Profile';

  @override
  String get addSubscription => 'Add Subscription';

  @override
  String get noSubscriptionsYet => 'No subscriptions yet';

  @override
  String get noSubscriptionsDescription =>
      'Add your first subscription to start tracking your spending';

  @override
  String get selectService => 'Select a Service';

  @override
  String get custom => 'Custom';

  @override
  String get customName => 'Custom Name';

  @override
  String get choosePlan => 'Choose a Plan';

  @override
  String get orEnterCustomAmount => 'Or Enter Custom Amount';

  @override
  String get amount => 'Amount';

  @override
  String get billingFrequency => 'Billing Frequency';

  @override
  String get monthly => 'Monthly';

  @override
  String get quarterly => 'Every 3 Months';

  @override
  String get semiannual => 'Every 6 Months';

  @override
  String get yearly => 'Yearly';

  @override
  String get startDate => 'Start Date';

  @override
  String get paymentAlerts => 'Payment Alerts';

  @override
  String get alertOneDayBefore => '1 day before';

  @override
  String get alertThreeDaysBefore => '3 days before';

  @override
  String get alertSevenDaysBefore => '7 days before';

  @override
  String get noAlerts => 'No alerts';

  @override
  String get continueLabel => 'Continue';

  @override
  String get back => 'Back';

  @override
  String get finish => 'Finish';

  @override
  String get nextPayment => 'Next payment';

  @override
  String get perMonth => '/mo';

  @override
  String get perYear => '/yr';

  @override
  String get chooseIcon => 'Choose Icon';

  @override
  String get chooseCategory => 'Choose Category';

  @override
  String get chooseColor => 'Choose Color';

  @override
  String get enterAmount => 'Enter amount';

  @override
  String get paymentReminder => 'Payment Reminder';

  @override
  String paymentReminderBody(String serviceName, String amount, String days) {
    return '$serviceName payment of $amount is due in $days days';
  }
}
