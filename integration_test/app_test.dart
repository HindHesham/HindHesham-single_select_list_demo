import 'package:flutter_test/flutter_test.dart';
import 'package:single_select_list_demo/main.dart' as app;

void main() {
  group('end to end test', () {
    testWidgets('Verify list screen ', (tester) async {
      app.main();

      await tester.pumpAndSettle();
    });
  });
}
