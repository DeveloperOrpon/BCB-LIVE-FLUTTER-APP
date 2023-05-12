import 'package:bcb_live_app/controller/home_controller.dart';
import 'package:bcb_live_app/utils/testStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../utils/demo_data.dart';

class HighlightCartUi extends StatelessWidget {
  final YoutubePlayerController youtubePlayerController;
  final Highlight highlight;
  final HomeController homeController;

  const HighlightCartUi({
    Key? key,
    required this.highlight,
    required this.youtubePlayerController,
    required this.homeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        homeController.selectHighlight.value = highlight;
        String? videoId = YoutubePlayer.convertUrlToId(
            homeController.selectHighlight.value!.videoUrl);
        youtubePlayerController.load(videoId!);
        homeController.miniPlayerController
            .animateToHeight(state: PanelState.MAX);
      },
      child: Stack(
        children: [
          Container(
            height: 200,
            width: Get.width,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(highlight.thumbnailUrl),
              ),
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.red,
              size: 70,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 200,
            width: Get.width,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                textAlign: TextAlign.center,
                highlight.title,
                style: whiteText,
              ),
            ),
          )
        ],
      ),
    );
  }
}
