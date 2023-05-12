import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../utils/demo_data.dart';

class HomeController extends GetxController {
  PageController homePageController = PageController();
  final YoutubePlayerController youtubePlayerController =
      YoutubePlayerController(
          initialVideoId: 'TJmk31zvhLM',
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            enableCaption: false,
            disableDragSeek: false,
            useHybridComposition: true,
            captionLanguage: 'en',
            forceHD: true,
          ));

  final MiniplayerController miniPlayerController = MiniplayerController();
  RxInt bottomNavigationPosition = 0.obs;
  final selectHighlight = Rxn<Highlight>();
}
