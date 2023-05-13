import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class LiveController extends GetxController {
  ChewieController? chewieController;
  final videoPlayerController = VideoPlayerController.network(
      // 'http://123.253.37.58/hls/stream106984.m3u8',
      // httpHeaders: {"Authorization": "Basic Y3JpY2tldDpjcmlja2V0NzE="},
      //base64)=(user:pass)
      'http://103.199.161.254/Content/bbcworld/Live/Channel(BBCworld)/index.m3u8',
      formatHint: VideoFormat.hls,
      videoPlayerOptions: VideoPlayerOptions());

  @override
  void onInit() {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
      isLive: true,
      showControlsOnInitialize: false,
      controlsSafeAreaMinimum: const EdgeInsets.all(0),
      errorBuilder: (context, errorMessage) {
        return Container(
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/ads/coming-soon.gif"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Next match starts tomorrow at 9AM",
              style: TextStyle(
                  color: Color.fromRGBO(242, 227, 219, 1), fontSize: 9),
            )
                .animate(onPlay: (controller) {
                  controller.repeat();
                })
                .scaleXY(end: 1.1, duration: 600.ms)
                .then(delay: GetNumUtils(5).seconds)
                .scaleXY(end: 1 / 1.1),
          ),
        );
      },
    );
    //
    if (chewieController!.isPlaying) {
      chewieController!.seekTo(const Duration(days: 30));
    }
    super.onInit();
  }
}
