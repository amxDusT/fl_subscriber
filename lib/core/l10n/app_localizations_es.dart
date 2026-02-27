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

  @override
  String get addSubscription => 'Añadir Suscripción';

  @override
  String get noSubscriptionsYet => 'Aún no hay suscripciones';

  @override
  String get noSubscriptionsDescription =>
      'Añade tu primera suscripción para empezar a controlar tus gastos';

  @override
  String get selectService => 'Seleccionar Servicio';

  @override
  String get custom => 'Personalizado';

  @override
  String get customName => 'Nombre Personalizado';

  @override
  String get choosePlan => 'Elige un Plan';

  @override
  String get orEnterCustomAmount => 'O Introduce un Importe';

  @override
  String get amount => 'Importe';

  @override
  String get billingFrequency => 'Frecuencia de Pago';

  @override
  String get monthly => 'Mensual';

  @override
  String get quarterly => 'Cada 3 Meses';

  @override
  String get semiannual => 'Cada 6 Meses';

  @override
  String get yearly => 'Anual';

  @override
  String get startDate => 'Fecha de Inicio';

  @override
  String get paymentAlerts => 'Alertas de Pago';

  @override
  String get alertOneDayBefore => '1 día antes';

  @override
  String get alertThreeDaysBefore => '3 días antes';

  @override
  String get alertSevenDaysBefore => '7 días antes';

  @override
  String get noAlerts => 'Sin alertas';

  @override
  String get continueLabel => 'Continuar';

  @override
  String get back => 'Atrás';

  @override
  String get finish => 'Finalizar';

  @override
  String get nextPayment => 'Próximo pago';

  @override
  String get perMonth => '/mes';

  @override
  String get perYear => '/año';

  @override
  String get chooseIcon => 'Elegir Icono';

  @override
  String get chooseCategory => 'Elegir Categoría';

  @override
  String get chooseColor => 'Elegir Color';

  @override
  String get enterAmount => 'Introduce el importe';

  @override
  String get paymentReminder => 'Recordatorio de Pago';

  @override
  String paymentReminderBody(String serviceName, String amount, String days) {
    return 'El pago de $serviceName de $amount vence en $days días';
  }

  @override
  String get deleteService => '¿Eliminar Servicio?';

  @override
  String deleteServiceConfirmation(String name) {
    return '$name se eliminará de tu catálogo.';
  }

  @override
  String get delete => 'Eliminar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get alert => 'Alerta';

  @override
  String alertDaysBefore(String days) {
    return '${days}d antes';
  }

  @override
  String get alertOff => 'Desactivada';

  @override
  String get category => 'Categoría';

  @override
  String get renewals => 'Renovaciones';

  @override
  String get categoryEntertainment => 'Entretenimiento';

  @override
  String get categoryProductivity => 'Productividad';

  @override
  String get categoryCloud => 'Almacenamiento en la Nube';

  @override
  String get categoryAi => 'Herramientas de IA';

  @override
  String get categoryDesign => 'Diseño';

  @override
  String get categoryDevelopment => 'Desarrollo';

  @override
  String get categorySocial => 'Social';

  @override
  String get categoryShopping => 'Compras';

  @override
  String get categoryFitness => 'Fitness';

  @override
  String get categoryEducation => 'Educación';

  @override
  String get categoryGaming => 'Videojuegos';

  @override
  String get categoryNews => 'Noticias';

  @override
  String get categoryFinance => 'Finanzas';

  @override
  String get categoryLifestyle => 'Estilo de Vida';

  @override
  String get categoryOther => 'Otro';

  @override
  String get activeSubscriptions => 'Activas';

  @override
  String get expiredSubscriptions => 'Canceladas';

  @override
  String get expired => 'Cancelada';

  @override
  String get endDate => 'Fecha de cancelación';

  @override
  String get openUnsubscribePage => 'Abrir página de cancelación';

  @override
  String get didYouUnsubscribe => '¿Te has dado de baja?';

  @override
  String didYouUnsubscribeMessage(String serviceName) {
    return '¿Has completado la cancelación de $serviceName?';
  }

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get restoreSubscription => 'Restaurar Suscripción';

  @override
  String get noExpiredSubscriptions => 'No hay suscripciones canceladas';

  @override
  String get noExpiredSubscriptionsDescription =>
      'Las suscripciones canceladas aparecerán aquí';

  @override
  String get periodThreeMonths => '3M';

  @override
  String get periodSixMonths => '6M';

  @override
  String get periodOneYear => '1A';

  @override
  String get periodAllTime => 'Todo';

  @override
  String get monthlyCost => 'Coste Mensual';

  @override
  String get yearlyProjected => 'Proyección Anual';

  @override
  String get activeCount => 'Activas';

  @override
  String get averagePerSub => 'Media / Sub';

  @override
  String get spendingByCategory => 'Gasto por Categoría';

  @override
  String get monthlyTrend => 'Tendencia Mensual';

  @override
  String get breakdown => 'Desglose';

  @override
  String get noAnalyticsData => 'Sin datos';

  @override
  String get noAnalyticsDataDescription =>
      'Añade suscripciones para ver tus estadísticas de gasto';

  @override
  String get noDataForPeriod => 'Sin datos para este periodo';

  @override
  String get noDataForPeriodDescription =>
      'No hubo suscripciones activas durante este periodo';

  @override
  String get perMonthAbbr => '/mes';

  @override
  String ofTotal(String percentage) {
    return '$percentage% del total';
  }
}
