import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayPage extends StatefulWidget {
  final String url;
  const YoutubeVideoPlayPage({Key? key, required this.url}) : super(key: key);

  @override
  State<YoutubeVideoPlayPage> createState() => _YoutubeVideoPlayPageState();
}

class _YoutubeVideoPlayPageState extends State<YoutubeVideoPlayPage> {
  YoutubePlayerController? _ytController;
  @override
  void initState() {
    EasyLoading.dismiss();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    String? videoId = YoutubePlayer.convertUrlToId(widget.url);
    _ytController = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        showLiveFullscreenButton: true,
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: true,
        enableCaption: true,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int fullScreen = 1;
    return OrientationBuilder(builder: (context, orientation) {
      return YoutubePlayerBuilder(
          player: YoutubePlayer(
            controlsTimeOut: const Duration(seconds: 1),
            aspectRatio: 16 / 7,
            controller: _ytController!,
            progressIndicatorColor: Colors.red,
            showVideoProgressIndicator: true,
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                    playedColor: Colors.red, bufferedColor: Colors.red),
              ),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.fullscreen_exit_outlined,
                    color: Colors.red,
                  ))
            ],
            onReady: () {
              log('onReady for');
            },
            onEnded: (YoutubeMetaData md) {
              _ytController!.seekTo(const Duration(seconds: 0));
            },
          ),
          onEnterFullScreen: () {},
          onExitFullScreen: () {
            if (fullScreen == 4) {
              Get.back();
            }
            fullScreen++;
          },
          builder: (context, player) {
            return WillPopScope(
              onWillPop: () async {
                if (_ytController != null) {
                  return true;
                }
                return false;
              },
              child: Scaffold(
                body: SafeArea(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/BG-1.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            player,
                            if (_ytController != null)
                              Positioned(
                                bottom: 7,
                                left: 0,
                                child: Container(
                                  width: Get.width,
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          _ytController!.toggleFullScreenMode();
                                        },
                                        icon: const Icon(
                                          Icons.fullscreen,
                                          color: Colors.red,
                                          size: 34,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars
  }
}
