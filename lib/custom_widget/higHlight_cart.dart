import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/youtube_payer_page.dart';
import '../utils/demo_data.dart';

class HighlightCart extends StatelessWidget {
  const HighlightCart({Key? key, required this.url, required this.id})
      : super(key: key);
  final String url;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            YoutubeVideoPlayPage(
              url: items[id].videoUrl,
            ),
            transition: Transition.rightToLeftWithFade);
      },
      child: Card(
        child: Container(
          height: 180,
          width: 150,
          padding: EdgeInsets.all(5),
          child: Stack(
            children: [
              Image.asset(
                url,
                height: 180,
                width: 150,
                fit: BoxFit.cover,
              ),
              Container(
                height: 180,
                width: 150,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [.1, .9],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Bangladesh Cricket Match Highlight 2023 all Match",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
