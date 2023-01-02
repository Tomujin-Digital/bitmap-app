import 'package:bitmap/constants.dart';
import 'package:bitmap/fee_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'controller/video.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});
  final VideoPlayerController? video = Get.put(VideoController()).video;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('0x2388891'),
          backgroundColor: kPrimaryColor,
        ),
        body: Stack(children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.fill,
              child: SizedBox(
                width: video?.value.size.width ?? 0,
                height: video?.value.size.height ?? 0,
                child: VideoPlayer(video!),
              ),
            ),
          ),
          Center(
            child: Column(children: [
              const SizedBox(height: 20),
              CircleAvatar(
                  maxRadius: 50.0,
                  minRadius: 50.0,
                  backgroundColor: Colors.white,
                  backgroundImage: Image.network(
                          'https://avatars.dicebear.com/api/bottts/0x2388891.png')
                      .image),
              const SizedBox(height: 20),
              const Text('Chingun Undrakh',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: kPrimaryBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: const FeePage(),
                ),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
