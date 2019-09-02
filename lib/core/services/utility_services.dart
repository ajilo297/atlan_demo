import 'package:atlan_demo/core/base/base_service.dart';
import 'package:uuid/uuid.dart';

class UtilityServices extends BaseService {
  bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  String get uuid => Uuid().v1();
}
