import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';
import '../providers/highlights_provider.dart';

class VideoPlayerWidget extends StatefulWidget {
  final Highlight _highlight;

  VideoPlayerWidget(this._highlight, {super.key});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late BetterPlayerController _betterPlayerController;
  late BetterPlayerConfiguration _betterPlayerConfiguration;

  @override
  void initState() {
    super.initState();

    _betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        aspectRatio: 16 / 9,
        autoPlay: false,
        looping: false,
        fit: BoxFit.contain,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          showControlsOnInitialize: true,
          enableSkips: false,
          enableFullscreen: true,
        ),
      ),
      betterPlayerDataSource: BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        widget._highlight.videoUrl,
      ),
    );
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        height: 500,
        child: BetterPlayer(controller: _betterPlayerController),
        ),

    );
  }
}
