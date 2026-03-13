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

  @override
  String get deleteService => 'Delete Service?';

  @override
  String deleteServiceConfirmation(String name) {
    return '$name will be removed from your catalog.';
  }

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String get alert => 'Alert';

  @override
  String alertDaysBefore(String days) {
    return '${days}d before';
  }

  @override
  String get alertOff => 'Off';

  @override
  String get category => 'Category';

  @override
  String get renewals => 'Renewals';

  @override
  String get categoryEntertainment => 'Entertainment';

  @override
  String get categoryProductivity => 'Productivity';

  @override
  String get categoryCloud => 'Cloud Storage';

  @override
  String get categoryAi => 'AI Tools';

  @override
  String get categoryDesign => 'Design';

  @override
  String get categoryDevelopment => 'Development';

  @override
  String get categorySocial => 'Social';

  @override
  String get categoryShopping => 'Shopping';

  @override
  String get categoryFitness => 'Fitness';

  @override
  String get categoryEducation => 'Education';

  @override
  String get categoryGaming => 'Gaming';

  @override
  String get categoryNews => 'News';

  @override
  String get categoryFinance => 'Finance';

  @override
  String get categoryLifestyle => 'Lifestyle';

  @override
  String get categoryOther => 'Other';

  @override
  String get activeSubscriptions => 'Active';

  @override
  String get expiredSubscriptions => 'Expired';

  @override
  String get expired => 'Expired';

  @override
  String get endDate => 'End date';

  @override
  String get openUnsubscribePage => 'Open cancellation page';

  @override
  String get didYouUnsubscribe => 'Did you unsubscribe?';

  @override
  String didYouUnsubscribeMessage(String serviceName) {
    return 'Did you complete the cancellation for $serviceName?';
  }

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get restoreSubscription => 'Restore Subscription';

  @override
  String get noExpiredSubscriptions => 'No expired subscriptions';

  @override
  String get noExpiredSubscriptionsDescription =>
      'Cancelled subscriptions will appear here';

  @override
  String get periodThreeMonths => '3M';

  @override
  String get periodSixMonths => '6M';

  @override
  String get periodOneYear => '1Y';

  @override
  String get periodAllTime => 'All';

  @override
  String get monthlyCost => 'Monthly Cost';

  @override
  String get yearlyProjected => 'Yearly Projected';

  @override
  String get activeCount => 'Active';

  @override
  String get averagePerSub => 'Avg / Sub';

  @override
  String get spendingByCategory => 'Spending by Category';

  @override
  String get monthlyTrend => 'Monthly Trend';

  @override
  String get breakdown => 'Breakdown';

  @override
  String get noAnalyticsData => 'No analytics data';

  @override
  String get noAnalyticsDataDescription =>
      'Add subscriptions to see your spending insights';

  @override
  String get noDataForPeriod => 'No data for this period';

  @override
  String get noDataForPeriodDescription =>
      'No subscriptions were active during this time range';

  @override
  String get perMonthAbbr => '/mo';

  @override
  String ofTotal(String percentage) {
    return '$percentage% of total';
  }

  @override
  String get hapticFeedback => 'Haptic Feedback';

  @override
  String get websiteLink => 'Website / Unsubscribe Link';

  @override
  String get urlHint => 'https://...';

  @override
  String toastSubscriptionAdded(String serviceName) {
    return '$serviceName added';
  }

  @override
  String toastSubscriptionCancelled(String serviceName) {
    return '$serviceName cancelled';
  }

  @override
  String toastSubscriptionRestored(String serviceName) {
    return '$serviceName restored';
  }
}
