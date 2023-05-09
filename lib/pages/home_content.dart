import 'package:bcb_live_app/pages/youtube_highlight_page.dart';
import 'package:bcb_live_app/utils/demo_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../custom_widget/today_match_widget.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 10,
        ),
        const TodayMatchWidget()
            .animate()
            .fade(duration: 100.ms)
            .scale(delay: 50.ms),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18.0, bottom: 7),
          child: Text(
            "MATCH HIGHLIGHTS ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
        Entry(
          xOffset: 200,
          delay: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 900),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.to(
                    const YoutubeHighlightPage(isFullPage: true),
                    transition: Transition.fadeIn,
                  );
                },
                child: Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 400.0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                      ),
                      items: items.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Stack(
                              children: [
                                Container(
                                  height: 400,
                                  width: Get.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      i.thumbnailUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  top: 0,
                                  left: 0,
                                  child: Image.asset(
                                    'assets/images/play_icon.png',
                                    width: 40,
                                    height: 40,
                                    color: Colors.redAccent.withOpacity(.6),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 190,
        //   child: ListView(
        //     scrollDirection: Axis.horizontal,
        //     shrinkWrap: true,
        //     children: const [
        //       HighlightCart(
        //         url: 'assets/ads/ad1.jpg',
        //         id: 0,
        //       ),
        //       HighlightCart(
        //         url: 'assets/ads/ad2.jpg',
        //         id: 2,
        //       ),
        //       HighlightCart(
        //         url: 'assets/ads/ad3.jpg',
        //         id: 1,
        //       ),
        //       HighlightCart(
        //         url: 'assets/ads/ad4.jpg',
        //         id: 3,
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
