import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

import '../constants.dart';
import 'highlights_screen.dart';

class LiveMatchPage extends StatefulWidget {
  const LiveMatchPage({Key? key}) : super(key: key);
  static const routeName = "/liveMatchPage";

  @override
  State<LiveMatchPage> createState() => _LiveMatchPageState();
}

class _LiveMatchPageState extends State<LiveMatchPage> {
  //http://103.199.161.254/Content/bbcworld/Live/Channel(BBCworld)/index.m3u8
  //http://iptv.rtv-ooe.at/stream.m3u8
  final videoPlayerController = VideoPlayerController.network(
      'http://iptv.rtv-ooe.at/stream.m3u8',
      formatHint: VideoFormat.hls,
      videoPlayerOptions: VideoPlayerOptions());
  late ChewieController chewieController;
  PageController parkingImageSlider = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      isLive: true,
      //customControls: Text("daihidh9iahdiuah"),
      showControlsOnInitialize: true,
      controlsSafeAreaMinimum: EdgeInsets.all(20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BCB Live"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.white,
            child: Stack(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Lottie.asset(
                      'assets/icons/loading.json',
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      fit: BoxFit.fill,
                    )),
                InteractiveViewer(
                  transformationController:
                      chewieController.transformationController,
                  maxScale: chewieController.maxScale,
                  panEnabled: chewieController.zoomAndPan,
                  scaleEnabled: chewieController.zoomAndPan,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    child: Chewie(
                      controller: chewieController,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Hero(
                    tag: '1',
                    child: GestureDetector(
                      onTap: () {
                        chewieController.videoPlayerController.pause();
                        Navigator.of(context)
                            .pushNamed(HighlightsScreen.routeName);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        color: Colors.transparent,
                        child: PageView(
                          physics: const BouncingScrollPhysics(),
                          controller: parkingImageSlider,
                          children: List.generate(
                            imageListOfBanner.length,
                            (index) => Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  imageListOfBanner[index],
                                  fit: BoxFit.cover,
                                ),
                                const CircleAvatar(
                                  radius: 30,
                                  child: Icon(Icons.play_arrow),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // indicator
                  Positioned(
                    bottom: 16,
                    child: SmoothPageIndicator(
                      controller: parkingImageSlider,
                      count: imageListOfBanner.length,
                      effect: const ExpandingDotsEffect(
                        dotColor: Colors.red,
                        activeDotColor: Colors.white,
                        dotHeight: 8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  chewieController.videoPlayerController.pause();
                  Navigator.of(context).pushNamed(HighlightsScreen.routeName);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset("assets/images/pic-1.jpg"),
                            const CircleAvatar(
                              radius: 20,
                              child: Icon(Icons.play_arrow),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              "assets/images/pic-3.jpg",
                              fit: BoxFit.fitWidth,
                            ),
                            const CircleAvatar(
                              radius: 20,
                              child: Icon(Icons.play_arrow),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  chewieController.videoPlayerController.pause();
                  Navigator.of(context).pushNamed(HighlightsScreen.routeName);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset("assets/images/cover1.jpg"),
                            const CircleAvatar(
                              radius: 20,
                              child: Icon(Icons.play_arrow),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              "assets/images/cover2.jpeg",
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fitWidth,
                            ),
                            const CircleAvatar(
                              radius: 20,
                              child: Icon(Icons.play_arrow),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  chewieController.videoPlayerController.pause();
                  Navigator.of(context).pushNamed(HighlightsScreen.routeName);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset("assets/images/pic-1.jpg"),
                            const CircleAvatar(
                              radius: 20,
                              child: Icon(Icons.play_arrow),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              "assets/images/pic-2.jpg",
                              fit: BoxFit.fitWidth,
                            ),
                            const CircleAvatar(
                              radius: 20,
                              child: Icon(Icons.play_arrow),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    chewieController.videoPlayerController.pause();
    super.dispose();
  }
}
