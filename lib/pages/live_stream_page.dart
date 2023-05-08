import 'package:bcb_live_app/provider/Live_provider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LiveStreamPage extends StatefulWidget {
  const LiveStreamPage({Key? key}) : super(key: key);

  @override
  State<LiveStreamPage> createState() => _LiveStreamPageState();
}

class _LiveStreamPageState extends State<LiveStreamPage> {
  @override
  Widget build(BuildContext context) {
    // Timer.periodic(const Duration(seconds: 10), (timer) {
    //   log("1 $timer");
    // });
    return Consumer<LiveStreamProvider>(
      builder: (context, liveStreamProvider, child) {
        liveStreamProvider.intVideo();
        if (liveStreamProvider.chewieController == null) {
          return const SpinKitWave(
            color: Colors.red,
            size: 50.0,
          );
        }
        return WillPopScope(
          onWillPop: () async {
            liveStreamProvider.chewieController!.pause();
            return true;
          },
          child: Scaffold(
            body: Container(
              width: Get.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/BG-1.jpg"))),
              child: DefaultTextStyle(
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
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
                            width: 60,
                            height: 60,
                          ),
                          Chewie(
                            controller: liveStreamProvider.chewieController!,
                          ),
                          Positioned(
                            bottom: -19,
                            left: 10,
                            child: Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  onPressed: () {},
                                  child: Text('Live'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
