import 'package:bcb_live_app/custom_widget/titleAppBar.dart';
import 'package:bcb_live_app/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../custom_widget/highlight_cart_ui.dart';
import '../custom_widget/miniBottomBar.dart';
import '../utils/demo_data.dart';

class YoutubeHighlightPage extends StatefulWidget {
  const YoutubeHighlightPage({
    Key? key,
  }) : super(key: key);

  @override
  State<YoutubeHighlightPage> createState() => _YoutubeHighlightPageState();
}

class _YoutubeHighlightPageState extends State<YoutubeHighlightPage> {
  static double playerMinHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  const TitleAppBar(),
                  Expanded(
                      child: AnimationLimiter(
                    child: ListView.builder(
                      physics: const ScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) =>
                          AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 700),
                        child: SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: HighlightCartUi(
                              highlight: items[index],
                              homeProvider: homeProvider,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              const MiniBottomBar()
            ],
          ),
        ),
      ),
    );
  }
}
