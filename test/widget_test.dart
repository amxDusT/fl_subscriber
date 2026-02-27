import 'package:fl_subscriber/app.dart';
import 'package:fl_subscriber/core/providers/preferences_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
        child: const App(),
      ),
    );

    expect(find.byType(App), findsOneWidget);

    // Let the SplashController's 2s timer complete to avoid pending timer error.
    await tester.pump(const Duration(seconds: 2));
    await tester.pump();
  });
}
