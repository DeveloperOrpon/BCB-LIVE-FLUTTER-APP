import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayPage extends StatefulWidget {
  final String url;
  const YoutubeVideoPlayPage({Key? key, required this.url}) : super(key: key);

  @override
  State<YoutubeVideoPlayPage> createState() => _YoutubeVideoPlayPageState();
}

class _YoutubeVideoPlayPageState extends State<YoutubeVideoPlayPage> {
  late YoutubePlayerController _ytController;

  @override
  void initState() {
    String? videoId = YoutubePlayer.convertUrlToId(widget.url);
    _ytController = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        captionLanguage: 'en',
        hideThumbnail: true,
        forceHD: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(title: const Text("Playing Highlight")),
      body: Container(
        alignment: Alignment.center,
        child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controlsTimeOut: const Duration(seconds: 1),
              aspectRatio: 16 / 9,
              controller: _ytController,
              progressIndicatorColor: Colors.red,
              showVideoProgressIndicator: true,
              bottomActions: [
                CurrentPosition(),
                FullScreenButton(
                  controller: _ytController,
                  color: Colors.pink,
                ),
              ],
              onReady: () {
                log('onReady for');
              },
              onEnded: (YoutubeMetaData md) {
                _ytController.seekTo(const Duration(seconds: 0));
              },
            ),
            onEnterFullScreen: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight,
              ]);
            },
            onExitFullScreen: () {
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp]);
              Future.delayed(const Duration(seconds: 1), () {
                _ytController.play();
              });
              Future.delayed(const Duration(seconds: 5), () {
                SystemChrome.setPreferredOrientations(DeviceOrientation.values);
              });
            },
            builder: (p0, p1) {
              return YoutubePlayer(
                controlsTimeOut: const Duration(seconds: 1),
                aspectRatio: 16 / 9,
                controller: _ytController,
                progressIndicatorColor: Colors.red,
                showVideoProgressIndicator: true,
                bottomActions: [
                  CurrentPosition(),
                  FullScreenButton(
                    controller: _ytController,
                    color: Colors.pink,
                  ),
                ],
                onReady: () {
                  log('onReady for');
                },
                onEnded: (YoutubeMetaData md) {
                  _ytController.seekTo(const Duration(seconds: 0));
                },
              );
            }),
      ),
    );
  }
}
