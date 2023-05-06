import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LiveMatchPage extends StatefulWidget {
  const LiveMatchPage({Key? key}) : super(key: key);
  static const routeName = "/liveMatchPage";

  @override
  State<LiveMatchPage> createState() => _LiveMatchPageState();
}

class _LiveMatchPageState extends State<LiveMatchPage> {
  final videoPlayerController = VideoPlayerController.network(
      'https://moctobpltc-i.akamaihd.net/hls/live/571329/eight/playlist.m3u8',
      formatHint: VideoFormat.hls,
      videoPlayerOptions: VideoPlayerOptions());
  late ChewieController chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      isLive: true,
      allowPlaybackSpeedChanging: false,
      overlay: AspectRatio(
        aspectRatio: 3 / 2,
        child: Image.asset("assets/images/cover1.jpg"),
      ),
      errorBuilder: (context, errorMessage) {
        return const Text("Offline Wait");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Chewie(controller: chewieController),
    );
  }

  @override
  void dispose() {
    chewieController.videoPlayerController.pause();
    super.dispose();
  }
}
