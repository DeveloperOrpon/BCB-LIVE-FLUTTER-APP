import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../custom_widget/highlight_cart_ui.dart';
import '../custom_widget/miniBottomBar.dart';
import '../utils/demo_data.dart';

class HighLightContent extends StatelessWidget {
  const HighLightContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (homeController) {
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
                      child: HighlightCartUi(
                        youtubePlayerController:
                            homeController.youtubePlayerController,
                        highlight: items[index],
                        homeController: homeController,
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
