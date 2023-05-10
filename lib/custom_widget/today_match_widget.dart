import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/watch_youtube_live_page.dart';

class TodayMatchWidget extends StatelessWidget {
  const TodayMatchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const WatchYoutubeLiveStream(), transition: Transition.fade);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.all(6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/cart-bg.jpg',
                width: Get.width,
                height: 200,
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(.5),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(6),
            width: Get.width,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.grey,
              //       offset: Offset(2, 2),
              //       spreadRadius: 2,
              //       blurRadius: 2)
              // ],
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blue.withOpacity(.3)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Column(
                      children: const [
                        Text(
                          "Dhaka Premier Division Cricket League",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Match 22",
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ))
                  ],
                ),
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/prime_bank.png',
                            width: 80,
                          ),
                          const Text(
                            textAlign: TextAlign.center,
                            "Prime Bank Cricket Club",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/vs.png",
                      color: Colors.red,
                      width: 60,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/mogamadan.png',
                            width: 60,
                          ),
                          const Text(
                            textAlign: TextAlign.center,
                            "Mohammedan Sporting Club",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
