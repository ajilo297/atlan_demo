import 'package:atlan_demo/ui/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

Future main() async {
  group('Widget test', () {
    testWidgets('Splash Test', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: SplashView(),
      ));

//      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text('Visitor Survey'), findsOneWidget);
    });
  });
}
