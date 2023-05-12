import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controller/home_controller.dart';
import '../utils/demo_data.dart';
import 'highlight_cart_ui.dart';

class MiniBottomBar extends StatelessWidget {
  const MiniBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (homeController) => Obx(() {
        return Offstage(
          offstage: homeController.selectHighlight.value == null,
          child: Miniplayer(
            controller: homeController.miniPlayerController,
            minHeight: 0.0,
            maxHeight: Get.height,
            builder: (height, percentage) {
              if (homeController.selectHighlight.value == null) {
                return const SizedBox.shrink();
              }
              return InkWell(
                onTap: () {
                  homeController.miniPlayerController
                      .animateToHeight(state: PanelState.MAX);
                },
                child: YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controlsTimeOut: const Duration(seconds: 1),
                      aspectRatio: 16 / 9,
                      controller: homeController.youtubePlayerController,
                      progressIndicatorColor: Colors.red,
                      showVideoProgressIndicator: true,
                      bottomActions: [
                        CurrentPosition(),
                        FullScreenButton(
                          controller: homeController.youtubePlayerController,
                          color: Colors.pink,
                        ),
                      ],
                      onReady: () {
                        log('onReady for');
                      },
                      onEnded: (YoutubeMetaData _md) {
                        homeController.youtubePlayerController
                            .seekTo(const Duration(seconds: 0));
                      },
                    ),
                    builder: (p0, player) {
                      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                          overlays: SystemUiOverlay.values);
                      return Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              automaticallyImplyLeading: false,
                              backgroundColor: Colors.black,
                              pinned: true,
                              bottom: PreferredSize(
                                  preferredSize: const Size.fromHeight(274),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Stack(
                                            children: [
                                              Image.asset(
                                                homeController.selectHighlight
                                                    .value!.thumbnailUrl,
                                                height: 220,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                              //youtube
                                              player,
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              homeController
                                                  .miniPlayerController
                                                  .animateToHeight(
                                                      state: PanelState.MIN);
                                              homeController
                                                  .youtubePlayerController
                                                  .pause();
                                            },
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      const LinearProgressIndicator(
                                        value: 1,
                                        valueColor:
                                            AlwaysStoppedAnimation(Colors.red),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          textAlign: TextAlign.justify,
                                          homeController
                                              .selectHighlight.value!.title,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Divider(
                                          color: Colors.white,
                                          height: 5,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => HighlightCartUi(
                                  youtubePlayerController:
                                      homeController.youtubePlayerController,
                                  highlight: items[index],
                                  homeController: homeController,
                                ),
                                childCount: items.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              );
            },
          ),
        );
      }),
    );
  }
}
