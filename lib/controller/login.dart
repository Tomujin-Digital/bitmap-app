import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class LoginController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();
  SupportState supportState = SupportState.unknown;
  String credential = '';
  String secretKey = '';
  bool authenticated = false;

  @override
  void onInit() async {
    super.onInit();
    auth.isDeviceSupported().then((bool isSupported) => supportState =
        isSupported ? SupportState.supported : SupportState.unsupported);
  }

  Future<bool> authenticate() async {
    try {
      if (supportState == SupportState.supported) {
        authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          options: const AuthenticationOptions(
            stickyAuth: true,
          ),
        );
      } else if (secretKey == '123') {
        authenticated = true;
      } else {
        throw PlatformException(
          code: 'Authentication Failed',
          message: 'Password Wrong',
        );
      }
    } on PlatformException catch (e) {
      authenticated = false;
      Get.snackbar('Error', e.message ?? 'Unknown error');
      if (kDebugMode) {
        print(e.code);
      }
    }
    return authenticated;
  }

  void updateCredential(String value) {
    credential = value;
    update();
  }

  void updateSecretKey(String value) {
    secretKey = value;
    update();
  }
}

enum SupportState {
  unknown,
  supported,
  unsupported,
}
