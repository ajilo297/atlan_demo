import 'package:atlan_demo/core/providers.dart' as prefix0;
import 'package:atlan_demo/ui/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Future main() async {
  group('Widget test', () {
    testWidgets('Splash Test', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: MultiProvider(
          providers: prefix0.providers,
          child: SplashView(),
        ),
      ));

      expect(find.text('Visitor Survey'), findsOneWidget);
    });
  });
}
