import 'package:carousel_slider/carousel_slider.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:untitled1/constants.dart';
import 'package:untitled1/screens/auth_screen.dart';
import 'package:untitled1/screens/highlights_screen.dart';
import 'package:untitled1/widgets/drawer_widget.dart';

import '../Model/search_delegate.dart';
import 'Live_Match_Page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Globals.colorGreen),
        title: Row(
          children: [
            SizedBox(
                height: 30,
                width: 30,
                child: Image.asset(
                  "assets/icons/bcblogo.jpg",
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "BCB Live",
              style: TextStyle(
                  fontFamily: "NewsGothicStd-BoldOblique",
                  color: Globals.colorGreen),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
              backgroundColor: Colors.black12,
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.green,
                ),
                onPressed: () {
                  showSearch(context: context, delegate: AppSearchDelegate());
                },
              )),
          const SizedBox(
            width: 15,
          ),
          CircleAvatar(
              backgroundColor: Colors.black12,
              child: IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(LoginSignupPage.routeName),
              )),
          const SizedBox(
            width: 15,
          )
        ],
        backgroundColor: Colors.white,
      ),
      drawer: DrawerWidget(),
      body: Entry(
        opacity: .2,
        delay: const Duration(milliseconds: 500),
        duration: const Duration(milliseconds: 900),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                    ),
                    items: imageListOfBanner.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                i,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/bcb_logo.png',
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ).animate(delay: 0.ms,onPlay: (controller) => controller.repeat()).shimmer(duration: 2.seconds)
                        // Shimmer(
                        //   gradient: LinearGradient(
                        //       stops: const [
                        //         0.4,
                        //         0.5,
                        //         0.6
                        //       ],
                        //       colors: [
                        //         Colors.white.withOpacity(0),
                        //         Colors.white.withOpacity(.5),
                        //         Colors.white.withOpacity(0),
                        //       ],
                        //       begin: Alignment.bottomLeft,
                        //       end: Alignment.topRight),
                        //   child: Container(
                        //     height: 100,
                        //     width: 100,
                        //     color: Colors.red,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushNamed(LiveMatchPage.routeName),
                    child: Column(
                      children: const [
                        RippleAnimation(
                          color: Globals.colorRed,
                          delay: Duration(milliseconds: 300),
                          repeat: true,
                          minRadius: 30,
                          ripplesCount: 6,
                          child: CircleAvatar(
                            backgroundColor: Globals.colorRed,
                            minRadius: 40,
                            child: Icon(
                              Icons.videocam,
                              color: Colors.white,
                              size: 45,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "WATCH LIVE",
                          style: TextStyle(
                              fontFamily: "NewsGothicStd",
                              fontSize: 24,
                              color: Globals.colorRed),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushNamed(HighlightsScreen.routeName),
                    child: Column(
                      children: const [
                        RippleAnimation(
                          color: Globals.colorGreen,
                          delay: Duration(milliseconds: 300),
                          repeat: true,
                          minRadius: 30,
                          ripplesCount: 6,
                          child: CircleAvatar(
                            backgroundColor: Globals.colorGreen,
                            minRadius: 40,
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 45,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "HIGHLIGHTS",
                          style: TextStyle(
                              fontFamily: "NewsGothicStd",
                              fontSize: 24,
                              color: Globals.colorGreen),
                        )
                      ],
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 5,
              ),
              Card(
                elevation: 10,
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text("Fixtures",
                        style: TextStyle(
                            fontFamily: "Montserrat-SemiBold",
                            fontSize: 30,
                            color: Globals.colorGreen)),
                    Image.asset("assets/images/cover2.jpeg")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(LiveMatchPage.routeName);
          },
          backgroundColor: Colors.red,
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
          )).animate().slideY(begin: 1, end: 0, duration: 400.ms),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 1) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  "Working On This Page",
                ),
                backgroundColor: Colors.green,
              ));
            }
          },
          backgroundColor: Globals.colorGreen,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  color: Colors.white,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                label: "")
          ]).animate().slideY(begin: 1, end: 0, duration: 500.ms),
    );
  }
}
