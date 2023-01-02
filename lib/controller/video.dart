import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController with StateMixin {
  VideoPlayerController? video;

  @override
  void onInit() async {
    super.onInit();
    video = VideoPlayerController.asset("assets/videos/neon-background.mp4")
      ..initialize().then((_) {
        video?.setVolume(0);
        video?.play();
        video?.setLooping(true);
        change("done", status: RxStatus.success());
      });
  }
}
