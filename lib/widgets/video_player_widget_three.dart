import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:untitled1/constants.dart';
import 'package:video_player/video_player.dart';
import '../providers/highlights_provider.dart';

class VideoPlayerScreen extends StatefulWidget {
  final Highlight highlight;

  VideoPlayerScreen(this.highlight, {super.key});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late ChewieController _chewieController;
  bool _showControls = false;
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      materialProgressColors: ChewieProgressColors(backgroundColor: Globals.colorGreen,handleColor: Colors.white,playedColor: Globals.colorRed,bufferedColor: Colors.green),
      videoPlayerController:
          VideoPlayerController.network(widget.highlight.videoUrl),
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(controller: _chewieController),
        ),
        _showControls
            ? Container(
                color: Colors.black54,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        _chewieController.seekTo(Duration(
                            seconds: _chewieController.videoPlayerController
                                    .value.position.inSeconds -
                                10));
                      },
                      icon: Icon(Icons.replay_10),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {
                        _chewieController.seekTo(Duration(
                            seconds: _chewieController.videoPlayerController
                                    .value.position.inSeconds +
                                10));
                      },
                      icon: Icon(Icons.forward_10),
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.videoPlayerController.pause();
    _chewieController.dispose();
  }
}
