import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubeUi extends StatelessWidget {
  final String url;
  const CustomYoutubeUi({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? videoId = YoutubePlayer.convertUrlToId(url);
    final controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    return YoutubePlayer(
      controlsTimeOut: const Duration(seconds: 1),
      aspectRatio: 16 / 9,
      controller: controller,
      progressIndicatorColor: Colors.red,
      showVideoProgressIndicator: true,
      bottomActions: [
        CurrentPosition(),
        ProgressBar(
          isExpanded: true,
          colors: const ProgressBarColors(
              playedColor: Colors.red, bufferedColor: Colors.red),
        ),
      ],
      onReady: () {
        log('onReady for');
      },
    );
  }
}
