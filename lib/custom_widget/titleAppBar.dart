
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../utils/app_const.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: Get.width * .15,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(appLogo)
                .animate(
                  delay: 0.ms,
                  onPlay: (controller) => controller.repeat(),
                )
                .shimmer(
                  duration: const Duration(seconds: 2),
                ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "BCB LIVE",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 21),
            ),
          ),
        ],
      ),
    );
  }
}
