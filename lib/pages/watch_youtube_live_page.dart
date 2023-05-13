import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../custom_widget/titleAppBar.dart';

class WatchYoutubeLiveStream extends StatefulWidget {
  const WatchYoutubeLiveStream({Key? key}) : super(key: key);

  @override
  State<WatchYoutubeLiveStream> createState() => _WatchYoutubeLiveStreamState();
}

class _WatchYoutubeLiveStreamState extends State<WatchYoutubeLiveStream> {
  late YoutubePlayerController _ytController;

  @override
  void initState() {
    String id = '2PndAqhp2Dk';
    _ytController = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        enableCaption: false,
        disableDragSeek: false,
        useHybridComposition: true,
        captionLanguage: 'en',
        isLive: true,
        forceHD: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _ytController.pause();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
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
        onEnded: (YoutubeMetaData _md) {
          _ytController.seekTo(const Duration(seconds: 0));
        },
      ),
      builder: (context, player) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              width: Get.width,
              height: Get.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/BG-1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const TitleAppBar(),
                  player,
                  const LinearProgressIndicator(
                    value: 1,
                    valueColor: AlwaysStoppedAnimation(Colors.red),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.justify,
                      'Lt. Sheikh Jamal Dhanmondi Club Ltd Vs Abahani Limited',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> _onWillPop() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return true;
  }
}

class _fullPage extends StatelessWidget {
  const _fullPage({
    super.key,
    required YoutubePlayerController ytController,
  }) : _ytController = ytController;
  final YoutubePlayerController _ytController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BCB Live"),
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: YoutubePlayer(
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
                    onEnded: (YoutubeMetaData _md) {
                      _ytController.seekTo(const Duration(seconds: 0));
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
