import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  String credential = '';

  void updateCredential(String value) {
    credential = value;
    update();
  }
}
