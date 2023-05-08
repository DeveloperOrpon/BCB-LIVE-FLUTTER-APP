import 'package:bcb_live_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../pages/live_stream_page.dart';
import '../pages/youtube_highlight_page.dart';

class CustomBottomWidget extends StatelessWidget {
  const CustomBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/BG-1.jpg',
            ),
            fit: BoxFit.fill,
          ),
          color: Colors.black),
      width: Get.width,
      height: 80,
      child: Stack(
        children: [
          ///Custom Paint drawer
          CustomPaint(
            size: Size(Get.width, 80),
            painter: BottomCustomPainter(),
          ),

          ///floating Action Button
          Center(
            heightFactor: 0.6,
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: FloatingActionButton(
                onPressed: () {
                  Get.to(const LiveStreamPage(),
                      transition: Transition.rightToLeftWithFade);
                },
                backgroundColor: Colors.red,
                elevation: 0.1,
                child: const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 25,
                  child: Icon(
                    Icons.live_tv_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),

          ///Other bottom nav Options
          SizedBox(
            width: Get.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Get.offAll(const HomePage(), transition: Transition.fadeIn);
                  },
                  icon: SvgPicture.asset(
                    'assets/images/home.svg',
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.offAll(const YoutubeHighlightPage(),
                        transition: Transition.fadeIn);
                  },
                  icon: Image.asset(
                    'assets/images/play_list.png',
                    color: Colors.white,
                  ),
                ),
                Container(width: Get.width * .20),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/notification.svg',
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/user.svg',
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xFF263A29)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.0450000);
    path0.lineTo(size.width * 0.0612500, size.height * 0.1000000);
    path0.lineTo(size.width * 0.1253500, size.height * 0.1500000);
    path0.lineTo(size.width * 0.1875000, size.height * 0.1800000);
    path0.lineTo(size.width * 0.2500000, size.height * 0.2000000);
    path0.lineTo(size.width * 0.3125000, size.height * 0.2200000);
    path0.lineTo(size.width * 0.4009375, size.height * 0.2015000);
    path0.quadraticBezierTo(size.width * 0.3886625, size.height * 0.7211500,
        size.width * 0.4014125, size.height * 0.7191000);
    path0.cubicTo(
        size.width * 0.4210625,
        size.height * 0.7695000,
        size.width * 0.6005375,
        size.height * 0.7688000,
        size.width * 0.6027625,
        size.height * 0.7164500);
    path0.quadraticBezierTo(size.width * 0.6144375, size.height * 0.6510000,
        size.width * 0.6003375, size.height * 0.2053500);
    path0.lineTo(size.width * 0.6250000, size.height * 0.2224500);
    path0.lineTo(size.width * 0.6875000, size.height * 0.2250000);
    path0.lineTo(size.width * 0.7496750, size.height * 0.2116500);
    path0.lineTo(size.width * 0.8126375, size.height * 0.1924000);
    path0.lineTo(size.width * 0.8737500, size.height * 0.1650000);
    path0.lineTo(size.width * 0.9379875, size.height * 0.1229500);
    path0.lineTo(size.width * 0.9987500, size.height * 0.0544500);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
