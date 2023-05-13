import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../controller/live_controller.dart';

class LiveStreamPage extends StatefulWidget {
  const LiveStreamPage({Key? key}) : super(key: key);
  @override
  State<LiveStreamPage> createState() => _LiveStreamPageState();
}

class _LiveStreamPageState extends State<LiveStreamPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LiveController(),
      builder: (liveStreamController) {
        if (liveStreamController.chewieController == null) {
          return const SpinKitWave(
            color: Colors.red,
            size: 50.0,
          );
        }
        return WillPopScope(
          onWillPop: () async {
            liveStreamController.chewieController!.pause();
            return true;
          },
          child: Scaffold(
            body: Container(
              width: Get.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/BG-1.jpg"),fit: BoxFit.fill)),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * .328,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          'assets/ads/cover_image.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/images/Logo-gif-4.gif",
                          width: 180,
                          height: 180,
                        ),
                        Chewie(
                          controller: liveStreamController.chewieController!,
                        ),
                        Positioned(
                          top: 20,
                          left: 10,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.withOpacity(.4),
                            ),
                            onPressed: () {
                              liveStreamController
                                  .chewieController!.videoPlayerController
                                  .seekTo(const Duration(days: 90));
                            },
                            child: const Text('Live'),
                          ),
                        ),
                        // Positioned(
                        //   bottom: 20,
                        //   left: 10,
                        //   child: Container(
                        //     width: Get.width,
                        //     padding: const EdgeInsets.only(left: 8.0, right: 8),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Spacer(),
                        //         IconButton(
                        //           onPressed: () {
                        //             liveStreamProvider.chewieController!
                        //                 .enterFullScreen();
                        //           },
                        //           icon: const Icon(
                        //             Icons.fullscreen,
                        //             color: Colors.red,
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
