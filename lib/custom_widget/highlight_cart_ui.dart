import 'package:bcb_live_app/utils/testStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/youtube_payer_page.dart';
import '../utils/demo_data.dart';

class HighlightCartUi extends StatelessWidget {
  final Highlight highlight;

  const HighlightCartUi({Key? key, required this.highlight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          YoutubeVideoPlayPage(
            url: highlight.videoUrl,
          ),
          transition: Transition.fadeIn,
        );
      },
      child: Stack(
        children: [
          Container(
            height: 200,
            width: Get.width,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(highlight.thumbnailUrl),
              ),
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.red,
              size: 70,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 200,
            width: Get.width,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                textAlign: TextAlign.center,
                highlight.title,
                style: whiteText,
              ),
            ),
          )
        ],
      ),
    );
  }
}
