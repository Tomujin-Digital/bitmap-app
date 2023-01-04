import 'components/Cart/content_cart.dart';
import 'components/SpiderChart/spider_chart.dart';
import 'constants.dart';
import 'fee_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'components/Tooltip/badge_tooltip.dart';
import 'controller/video.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});
  final VideoPlayerController? video = Get.put(VideoController()).video;

  @override
  Widget build(BuildContext context) {
    const expandedHeight = 250.0;
    const collapsedHeight = 60.0;
    return SafeArea(
      child: Scaffold(
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
          CustomScrollView(
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
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  title: Column(
                    children: const [
                      SizedBox(height: 20),
                      Text('Chingun Undrakh',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                  background: Stack(
                    children: [
                      Positioned(
                        bottom: collapsedHeight + 30,
                        left: MediaQuery.of(context).size.width / 2 - 50,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://avatars.dicebear.com/api/bottts/0x2388891.png'),
                            radius: 45,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: collapsedHeight + 30,
                        left: MediaQuery.of(context).size.width / 2 - 50,
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: const BadgeTooltip(
                            message: "Group 1",
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/icons/diamond.png'),
                              radius: 15,
                            ),
                          ),
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
                      child: SpiderChart(),
                    ),
                    ContentCard(
                      title: "Teachers Told Me",
                      subtitle: "Latest say: Cheer up!",
                    ),
                    ContentCard(
                      title: "My Activity",
                      subtitle: "You have 3 strike",
                    ),
                    ContentCard(
                      title: "Challenges",
                      subtitle: "test",
                    ),
                    ContentCard(
                      title: "My Rewards",
                      subtitle: "test",
                    ),
                  ]),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
