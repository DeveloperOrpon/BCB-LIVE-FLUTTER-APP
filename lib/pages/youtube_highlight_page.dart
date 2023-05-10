import 'package:bcb_live_app/custom_widget/titleAppBar.dart';
import 'package:bcb_live_app/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../custom_widget/highlight_cart_ui.dart';
import '../utils/demo_data.dart';

class YoutubeHighlightPage extends StatelessWidget {
  const YoutubeHighlightPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return YoutubePlayerBuilder(
          player: YoutubePlayer(
            aspectRatio: 16 / 9,
            controller: homeProvider.youtubePlayerController,
            progressIndicatorColor: Colors.red,
            showVideoProgressIndicator: true,
            bottomActions: [
              CurrentPosition(),
              FullScreenButton(
                controller: homeProvider.youtubePlayerController,
                color: Colors.pink,
              ),
            ],
            onReady: () {},
          ),
          builder: (context, player) {
            return Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const TitleAppBar(),
                        Expanded(
                            child: AnimationLimiter(
                          child: ListView.builder(
                            physics: const ScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (context, index) =>
                                AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 700),
                              child: SlideAnimation(
                                horizontalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: HighlightCartUi(
                                    youtubePlayerController:
                                        homeProvider.youtubePlayerController,
                                    highlight: items[index],
                                    homeProvider: homeProvider,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    //const MiniBottomBar()
                  ],
                ),
              ),
            );
          });
    });
  }
}
