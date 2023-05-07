import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/constants.dart';
import 'package:untitled1/providers/highlights_provider.dart';
import 'package:untitled1/widgets/drawer_widget.dart';
import 'package:untitled1/widgets/video_player_widget_three.dart';

import 'auth_screen.dart';

class HighlightsScreen extends StatelessWidget {
  const HighlightsScreen({Key? key}) : super(key: key);

  static const routeName = "/highlights_screen";

  Future<void> _refreshHighlights() async {}

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Globals.colorGreen),
        title: const Text("Highlights",
            style: TextStyle(
                color: Color.fromRGBO(65, 100, 74, 1),
                fontWeight: FontWeight.bold,
                fontFamily: "NewsGothicStd-BoldOblique")),
        backgroundColor: Colors.white,
        actions: [
          const CircleAvatar(
              backgroundColor: Colors.black12,
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.green,
                ),
                onPressed: null,
              )),
          const SizedBox(
            width: 15,
          ),
          CircleAvatar(
              backgroundColor: Colors.black12,
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(LoginSignupPage.routeName),
              )),
          SizedBox(
            width: 15,
          )
        ],
      ),
      backgroundColor: Colors.white,
      drawer: DrawerWidget(),
      body: FutureBuilder(
          future: _refreshHighlights(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: _refreshHighlights,
                      child: Consumer<Highlights>(
                        builder: (context, data, _) => Padding(
                          padding: EdgeInsets.all(8),
                          child: ListView.builder(
                            itemCount: data.items.length,
                            itemBuilder: (context, index) => Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    VideoPlayerScreen(data.items[index]),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        data.items[index].title,
                                        style: const TextStyle(
                                          fontFamily: "NewsGothicStd",
                                          fontSize: 12
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                                .animate(delay: 500.ms)
                                .shimmer(
                                  duration: 2.seconds,
                                )
                                .slideX(duration: 500.ms)
                                .fadeIn(duration: 500.ms),
                          ),
                        ),
                      ),
                    )),
    );
  }
}
