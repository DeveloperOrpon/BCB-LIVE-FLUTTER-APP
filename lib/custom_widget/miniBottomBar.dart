import 'package:bcb_live_app/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../utils/demo_data.dart';
import 'highlight_cart_ui.dart';

class MiniBottomBar extends StatelessWidget {
  const MiniBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => Offstage(
        offstage: homeProvider.selectHighlight == null,
        child: Miniplayer(
          controller: homeProvider.miniPlayerController,
          minHeight: 0.0,
          maxHeight: Get.height,
          builder: (height, percentage) {
            if (homeProvider.selectHighlight == null) {
              return const SizedBox.shrink();
            }
            return InkWell(
              onTap: () {
                homeProvider.miniPlayerController
                    .animateToHeight(state: PanelState.MAX);
              },
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      leading: IconButton(
                          onPressed: () {
                            homeProvider.youtubePlayerController.pause();
                          },
                          icon: const Icon(
                              CupertinoIcons.arrowtriangle_down_fill)),
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
                                        homeProvider
                                            .selectHighlight!.thumbnailUrl,
                                        height: 220,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      //youtube
                                      YoutubePlayer(
                                        controlsTimeOut:
                                            const Duration(seconds: 1),
                                        aspectRatio: 16 / 9,
                                        controller: homeProvider
                                            .youtubePlayerController,
                                        progressIndicatorColor: Colors.red,
                                        showVideoProgressIndicator: true,
                                        bottomActions: [
                                          CurrentPosition(),
                                          ProgressBar(
                                            isExpanded: true,
                                            colors: const ProgressBarColors(
                                              playedColor: Colors.red,
                                              bufferedColor: Colors.red,
                                            ),
                                          ),
                                        ],
                                        onReady: () {},
                                      )
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      homeProvider.miniPlayerController
                                          .animateToHeight(
                                              state: PanelState.MIN);
                                      homeProvider.youtubePlayerController
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
                                valueColor: AlwaysStoppedAnimation(Colors.red),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  textAlign: TextAlign.justify,
                                  homeProvider.selectHighlight!.title,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
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
                                homeProvider.youtubePlayerController,
                            highlight: items[index],
                            homeProvider: homeProvider),
                        childCount: items.length,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
