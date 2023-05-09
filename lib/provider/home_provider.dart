import 'dart:developer';

import 'package:bcb_live_app/utils/demo_data.dart';
import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';

class HomeProvider extends ChangeNotifier {
  PageController homePageController = PageController();
  int _videoId = 0;
  Highlight? _selectHighlight;
  final MiniplayerController miniPlayerController = MiniplayerController();
  int _bottomNavigationPosition = 0;

  int get bottomNavigationPosition => _bottomNavigationPosition;

  set bottomNavigationPosition(int value) {
    _bottomNavigationPosition = value;

    notifyListeners();
  }

  Highlight? get selectHighlight => _selectHighlight;

  set selectHighlight(Highlight? value) {
    _selectHighlight = value;
    log(selectHighlight!.videoUrl);
    notifyListeners();
  }

  int get videoId => _videoId;

  set videoId(int value) {
    _videoId = value;
    notifyListeners();
  }
}
