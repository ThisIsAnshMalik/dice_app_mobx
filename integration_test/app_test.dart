import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dice_app_mobx/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("end-to-end test", () {
    testWidgets(
      "tap on dice and check the output of both the dice",
      (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        // find the dice button
        final Finder diceButton = find.byKey(Key("dice_button"));

        // perform tap 10 times on dicebutton
        for (var i = 0; i < 10; i++) {
          await tester.tap(diceButton);
          await tester.pumpAndSettle();
        }
      },
    );
  });
}
