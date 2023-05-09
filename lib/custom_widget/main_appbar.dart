import 'dart:async';

import 'package:bcb_live_app/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import '../pages/live_stream_page.dart';

class MainAppbar extends StatelessWidget {
  const MainAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(appLogo)
                      .animate(
                        delay: 0.ms,
                        onPlay: (controller) => controller.repeat(),
                      )
                      .shimmer(
                        duration: const Duration(seconds: 2),
                      ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      "BCB LIVE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 21),
                    )),
                const SizedBox(
                    height: 35,
                    child: VerticalDivider(color: Colors.grey, thickness: 1)),
                StatefulBuilder(builder: (context, setStateNew) {
                  Timer.periodic(const Duration(seconds: 2), (timer) {
                    setStateNew(() {});
                  });
                  return Text(
                      '${DateFormat.jm().format(DateTime.now())}\n${DateFormat.yMMMd().format(DateTime.now())}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w100,
                          color: Colors.white70,
                          fontSize: 14));
                  // return Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     AnimatedTextKit(
                  //       pause: const Duration(seconds: 0),
                  //       repeatForever: true,
                  //       animatedTexts: [
                  //         RotateAnimatedText(
                  //             ),
                  //         ColorizeAnimatedText('Live On\nTap To Watch',
                  //             textStyle: const TextStyle(
                  //               fontWeight: FontWeight.w100,
                  //               color: Colors.red,
                  //               fontSize: 14,
                  //             ),
                  //             colors: [
                  //               Colors.red,
                  //               Colors.amber,
                  //               Colors.pink,
                  //             ]),
                  //       ],
                  //     ),
                  //   ],
                  // );
                }),
              ],
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              Get.to(const LiveStreamPage(),
                  transition: Transition.rightToLeftWithFade);
            },
            child: const RippleAnimation(
              color: Colors.redAccent,
              delay: Duration(milliseconds: 300),
              repeat: true,
              minRadius: 26,
              ripplesCount: 4,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 25,
                child: Icon(
                  Icons.live_tv_sharp,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
