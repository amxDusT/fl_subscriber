import 'package:fl_subscriber/features/main/presentation/pages/main_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MainPage()),
    );

    expect(find.byType(MainPage), findsOneWidget);
  });
}
