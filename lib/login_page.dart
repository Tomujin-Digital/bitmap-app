import 'package:bitmap/user_page.dart';
import 'package:bitmap/controller/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'constants.dart';
import 'controller/login.dart';

class LoginPage extends GetView<VideoController> {
  LoginPage({super.key});
  final LoginController loginGetControler = Get.put(LoginController());
  final VideoController videoGetControler = Get.put(VideoController());

  inputHandler(BuildContext context) {
    return loginGetControler.updateCredential;
  }

  void submitHandler() {
    if (loginGetControler.credential.obs.isEmpty) return;
    Get.to(UserPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: controller.obx(
            (state) => Center(
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: SizedBox(
                        width: videoGetControler.video?.value.size.width ?? 0,
                        height: videoGetControler.video?.value.size.height ?? 0,
                        child: VideoPlayer(videoGetControler.video.obs.value!),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          onSubmitted: (_) => submitHandler(),
                          onChanged: inputHandler(context),
                          style: const TextStyle(color: Colors.white),
                          cursorColor: kPrimaryColor,
                          decoration: const InputDecoration(
                              hintText: '0x2388891',
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: 'Click me',
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF4700a9)),
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: submitHandler,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                              ),
                              child: const Text('Encode'),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            onLoading: const Center(
              child: CircularProgressIndicator(),
            ),
          )),
    );
  }
}
