import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:local_auth/local_auth.dart';

class LoginController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();
  SupportState supportState = SupportState.unknown;
  String credential = '';
  bool authenticated = false;

  @override
  void onInit() async {
    super.onInit();
    auth.isDeviceSupported().then((bool isSupported) => supportState =
        isSupported ? SupportState.supported : SupportState.unsupported);
  }

  Future<bool> authenticate() async {
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return authenticated;
  }

  void updateCredential(String value) {
    credential = value;
    update();
  }
}

enum SupportState {
  unknown,
  supported,
  unsupported,
}
