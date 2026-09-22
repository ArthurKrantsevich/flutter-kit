import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_kit_dashboard/main.dart';

void main() {
  testWidgets('shows the title', (tester) async {
    await tester.pumpWidget(const DashboardApp());
    expect(find.text('flutter-kit'), findsOneWidget);
  });
}
