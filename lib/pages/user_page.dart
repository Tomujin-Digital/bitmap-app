import 'package:bitmap/components/Chart/line_chart.dart';
import 'package:bitmap/components/Tooltip/custom_tooltip.dart';

import '../components/Cart/content_cart.dart';
import '../components/Chart/spider_chart.dart';
import '../constants.dart';
import 'fee_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../components/Tooltip/badge_tooltip.dart';
import '../controller/video.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});
  final VideoPlayerController? video = Get.put(VideoController()).video;

  @override
  Widget build(BuildContext context) {
    const expandedHeight = 150.0;
    const collapsedHeight = 60.0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryBackgroundColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.pending_actions),
                  onPressed: () {
                    Get.to(() => const FeePage());
                  },
                ),
              ],
              expandedHeight: expandedHeight,
              collapsedHeight: collapsedHeight,
              floating: false,
              pinned: true,
              snap: false,
              backgroundColor: kPrimaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: true,
                title: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('0x2388891',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        const SizedBox(width: 5),
                        Container(
                          padding: const EdgeInsets.all(1),
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: const BadgeTooltip(
                            message: "Diamond",
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/icons/diamond.png'),
                              radius: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                background: Stack(
                  children: [
                    SizedBox.expand(
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            color: kPrimaryColor),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: video?.value.size.height ?? 0,
                            child: VideoPlayer(video!),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: const LineChartSample2()),
                    ),
                    Positioned(
                      bottom: 30,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                ),
                                child: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://avatars.dicebear.com/api/bottts/0x2388891.png'),
                                  radius: 30,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Chingun Undrakh',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Column(children: const [
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: CustomTooltip(
                        message: 'You have a hacker mind',
                        child: SpiderChart()),
                  ),
                  ContentCard(
                      title: "Teachers Told Me",
                      subtitle: "Zaya say: Хадгалаж болох...",
                      imageSrc:
                          'https://quotefancy.com/media/wallpaper/3840x2160/3308249-Ernest-Gallo-Quote-My-first-grade-teacher-told-me-I-was-the.jpg'),
                  ContentCard(
                    title: "My Status",
                    subtitle: "You're almost be a Hacker Mind!",
                    imageSrc:
                        'https://i.pinimg.com/originals/8a/c5/5c/8ac55c4329b8a9208de17e2a7cde2774.jpg',
                  ),
                  ContentCard(
                    title: "My Projects",
                    subtitle: "",
                    imageSrc: 'https://wallpaperaccess.com/full/1930875.jpg',
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
