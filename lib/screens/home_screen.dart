import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:untitled1/constants.dart';
import 'package:untitled1/screens/auth_screen.dart';
import 'package:untitled1/screens/highlights_screen.dart';
import 'package:untitled1/widgets/drawer_widget.dart';

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
            Container(
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
                  fontFamily: "Montserrat-ExtraBold",
                  color: Globals.colorGreen),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
              backgroundColor: Colors.black12,
              child: IconButton(
                icon: Icon(Icons.search,color: Colors.green,), onPressed: null,
              )),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
              backgroundColor: Colors.black12,
              child: IconButton(
                icon: Icon(Icons.person,color: Colors.green,), onPressed: () => Navigator.of(context).pushNamed(LoginSignupPage.routeName) ,
              )),
          SizedBox(
            width: 15,
          )
        ],
        backgroundColor: Colors.white,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 10,
              color: Colors.white70,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset("assets/images/cover1.jpg"),
                  const Text("Latest Events",
                      style: TextStyle(
                          fontFamily: "Montserrat-SemiBold",
                          fontSize: 30,
                          color: Globals.colorRed))
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: null,
                  child: Column(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Globals.colorRed,
                        minRadius: 40,
                        child: Icon(
                          Icons.videocam,
                          color: Colors.white,
                          size: 45,
                        ),
                      ),
                      Text(
                        "WATCH LIVE",
                        style: TextStyle(
                            fontFamily: "Montserrat-Medium",
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
                      CircleAvatar(
                        backgroundColor: Globals.colorGreen,
                        minRadius: 40,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 45,
                        ),
                      ),
                      Text(
                        "HIGHLIGHTS",
                        style: TextStyle(
                            fontFamily: "Montserrat-Medium",
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
      floatingActionButton: const FloatingActionButton(
          onPressed: null,
          backgroundColor: Globals.colorGreen,
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
          )).animate().slideY(begin: 1, end: 0, duration: 400.ms),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
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
