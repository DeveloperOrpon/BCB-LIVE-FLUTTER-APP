import 'package:bcb_live_app/pages/youtube_payer_page.dart';
import 'package:bcb_live_app/utils/custom_dialog.dart';
import 'package:bcb_live_app/utils/demo_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../custom_widget/today_match_widget.dart';
import '../provider/home_provider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TodayMatchWidget()
              .animate()
              .fade(duration: 100.ms)
              .scale(delay: 50.ms),

          const Padding(
            padding: EdgeInsets.only(left: 18.0, bottom: 7),
            child: Text(
              "MATCH HIGHLIGHTS ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 320.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                    ),
                    items: items.map((i) {
                      return InkWell(
                        onTap: () {
                          startLoading("Wait");
                          Get.to(
                            YoutubeVideoPlayPage(url: i.videoUrl),
                            transition: Transition.fadeIn,
                          );
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 210,
                                  width: Get.width,
                                  margin: const EdgeInsets.symmetric(),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: Image.asset(
                                      i.thumbnailUrl,
                                      fit: BoxFit.fill,
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
                                    color: Colors.redAccent.withOpacity(.8),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  )),
                              child: Text(
                                textAlign: TextAlign.center,
                                i.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
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
      ),
    );
  }
}
