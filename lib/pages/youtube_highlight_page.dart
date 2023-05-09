import 'package:bcb_live_app/custom_widget/titleAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../custom_widget/highlight_cart_ui.dart';
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
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          )
        : AnimationLimiter(
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
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
