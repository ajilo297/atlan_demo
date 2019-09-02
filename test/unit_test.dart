import 'package:atlan_demo/core/services/utility_services.dart';
import 'package:flutter_test/flutter_test.dart';

Future main() async {
  group('Unit Tests', () {
    test('Validate Email Test', () {
      UtilityServices utilityServices = UtilityServices();

      String email1 = 'ajilo297@gmail.com';
      expect(utilityServices.isValidEmail(email1), true);

      String email2 = 'google.com';
      expect(utilityServices.isValidEmail(email2), false);
    });
  });
}
