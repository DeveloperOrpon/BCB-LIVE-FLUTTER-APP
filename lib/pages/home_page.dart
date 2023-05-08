import 'package:bcb_live_app/pages/youtube_highlight_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../custom_widget/custom_bottom_widget.dart';
import '../custom_widget/higHlight_cart.dart';
import '../custom_widget/main_appbar.dart';
import '../custom_widget/today_match_widget.dart';
import '../utils/app_const.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //startLoading("Updating..");
    Future.delayed(
      const Duration(seconds: 5),
      () {
        EasyLoading.dismiss();
      },
    );
    return Scaffold(
      bottomNavigationBar: const CustomBottomWidget(),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/BG-1.jpg"), fit: BoxFit.cover),
          ),
          child: ListView(
            children: [
              const MainAppbar(),
              const SizedBox(
                height: 10,
              ),
              const TodayMatchWidget(),
              const SizedBox(
                height: 10,
              ),
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
              Entry(
                opacity: .2,
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 900),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(
                          const YoutubeHighlightPage(),
                          transition: Transition.fadeIn,
                        );
                      },
                      child: Stack(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 200.0,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                            ),
                            items: imageListOfBanner.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Stack(
                                    children: [
                                      Container(
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 5),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.asset(
                                            i,
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
                                          color:
                                              Colors.redAccent.withOpacity(.6),
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
              SizedBox(
                height: 190,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: const [
                    HighlightCart(
                      url: 'assets/ads/ad1.jpg',
                      id: 0,
                    ),
                    HighlightCart(
                      url: 'assets/ads/ad2.jpg',
                      id: 2,
                    ),
                    HighlightCart(
                      url: 'assets/ads/ad3.jpg',
                      id: 1,
                    ),
                    HighlightCart(
                      url: 'assets/ads/ad4.jpg',
                      id: 3,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
