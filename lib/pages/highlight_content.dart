import 'package:bcb_live_app/pages/youtube_payer_page.dart';
import 'package:bcb_live_app/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../custom_widget/highlight_cart_ui.dart';
import '../custom_widget/miniBottomBar.dart';
import '../utils/demo_data.dart';

class HighLightContent extends StatelessWidget {
  const HighLightContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Stack(
          children: [
            AnimationLimiter(
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
                      child: InkWell(
                        onTap: () {
                          Get.to(
                              YoutubeVideoPlayPage(
                                url: items[index].videoUrl,
                              ),
                              transition: Transition.fade);
                        },
                        child: IgnorePointer(
                          ignoring: true,
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
                ),
              ),
            ),
            const MiniBottomBar(),
          ],
        );
      },
    );
  }
}
