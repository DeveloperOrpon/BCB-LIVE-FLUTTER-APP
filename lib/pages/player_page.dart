import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controller/home_controller.dart';
import '../custom_widget/highlight_cart_ui.dart';
import '../utils/demo_data.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (homeController) => YoutubePlayerBuilder(
          onExitFullScreen: () {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: SystemUiOverlay.values);
          },
          player: YoutubePlayer(
            controlsTimeOut: const Duration(seconds: 1),
            aspectRatio: 16 / 8,
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
            onEnded: (YoutubeMetaData _md) {
              homeController.youtubePlayerController
                  .seekTo(const Duration(seconds: 0));
            },
          ),
          builder: (p0, player) {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: SystemUiOverlay.values);
            return Scaffold(
                body: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.black,
                    pinned: true,
                    bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(242),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                      homeController
                                          .selectHighlight.value!.thumbnailUrl,
                                      height: 180,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    //youtube
                                    player,
                                  ],
                                ),
                                Positioned(
                                  left: 10,
                                  child: IconButton(
                                    onPressed: () {
                                      Get.back();
                                      homeController.youtubePlayerController
                                          .pause();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      size: 30,
                                      color: Colors.red,
                                    ),
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
                                homeController.selectHighlight.value!.title,
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
                            homeController.youtubePlayerController,
                        highlight: items[index],
                        homeController: homeController,
                      ),
                      childCount: items.length,
                    ),
                  ),
                ],
              ),
            ));
          }),
    );
  }
}
