import 'package:bcb_live_app/custom_widget/main_appbar.dart';
import 'package:bcb_live_app/pages/youtube_payer_page.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/demo_data.dart';

class YoutubeHighlightPage extends StatelessWidget {
  final bool isFullPage;

  const YoutubeHighlightPage({Key? key, required this.isFullPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isFullPage
        ? Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const MainAppbar(),
                  Expanded(
                      child: Entry(
                    yOffset: 200,
                    curve: Curves.linearToEaseOut,
                    delay: const Duration(milliseconds: 300),
                    duration: const Duration(milliseconds: 500),
                    child: ListView(
                      physics: const ScrollPhysics(),
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(
                                YoutubeVideoPlayPage(
                                  url: items[0].videoUrl,
                                ),
                                transition: Transition.rightToLeftWithFade);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/ads/ad1.jpg"),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.red,
                                    size: 70,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/ads/ad2.jpg"),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.red,
                                    size: 70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Get.to(
                                YoutubeVideoPlayPage(
                                  url: items[1].videoUrl,
                                ),
                                transition: Transition.rightToLeftWithFade);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/ads/ad3.jpg"),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.red,
                                    size: 70,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/ads/ad4.jpg"),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.red,
                                    size: 70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Get.to(
                                YoutubeVideoPlayPage(
                                  url: items[2].videoUrl,
                                ),
                                transition: Transition.rightToLeftWithFade);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("assets/images/pic-3.jpg"),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.red,
                                    size: 70,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("assets/images/pic-2.jpg"),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.red,
                                    size: 70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Get.to(
                                YoutubeVideoPlayPage(
                                  url: items[2].videoUrl,
                                ),
                                transition: Transition.rightToLeftWithFade);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/cover1.jpg"),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.red,
                                    size: 70,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/ads/ad2.jpg"),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.red,
                                    size: 70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Get.to(
                                YoutubeVideoPlayPage(
                                  url: items[1].videoUrl,
                                ),
                                transition: Transition.rightToLeftWithFade);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/ads/ad1.jpg"),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.red,
                                    size: 70,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/ads/ad2.jpg"),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.red,
                                    size: 70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Entry(
              yOffset: -400,
              curve: Curves.linearToEaseOut,
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 500),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(
                              YoutubeVideoPlayPage(
                                url: items[0].videoUrl,
                              ),
                              transition: Transition.rightToLeftWithFade);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 150,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/ads/ad1.jpg"),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 70,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 150,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/ads/ad2.jpg"),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.to(
                              YoutubeVideoPlayPage(
                                url: items[1].videoUrl,
                              ),
                              transition: Transition.rightToLeftWithFade);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 150,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/ads/ad3.jpg"),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 70,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 150,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/ads/ad4.jpg"),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.to(
                              YoutubeVideoPlayPage(
                                url: items[2].videoUrl,
                              ),
                              transition: Transition.rightToLeftWithFade);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 150,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/pic-3.jpg"),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 70,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 150,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/pic-2.jpg"),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.to(
                              YoutubeVideoPlayPage(
                                url: items[2].videoUrl,
                              ),
                              transition: Transition.rightToLeftWithFade);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 150,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/cover1.jpg"),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 70,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 150,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/ads/ad2.jpg"),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.to(
                              YoutubeVideoPlayPage(
                                url: items[1].videoUrl,
                              ),
                              transition: Transition.rightToLeftWithFade);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 150,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/ads/ad1.jpg"),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 70,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 150,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/ads/ad2.jpg"),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ));
  }
}
