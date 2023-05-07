import 'package:flutter/material.dart';
import 'package:untitled1/screens/highlights_screen.dart';
import 'package:untitled1/screens/home_screen.dart';

import '../constants.dart';
import '../screens/Live_Match_Page.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      width: MediaQuery.of(context).size.width * 0.5,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Globals.colorGreen,
              ),
              child: Container(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                    "assets/images/bcb_logo.png",
                    fit: BoxFit.fill,
                  ))),
          ListTile(
            selectedColor: Globals.colorGreen,
            title: const Text('Home',
                style: TextStyle(
                    fontFamily: "Montserrat-SemiBold",
                    color: Globals.colorGreen,
                    fontSize: 14)),
            onTap: () {
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            },
          ),
          ListTile(
            selectedColor: Globals.colorGreen,
            title: const Text('Watch Live',
                style: TextStyle(
                    fontFamily: "Montserrat-SemiBold",
                    color: Globals.colorGreen,
                    fontSize: 14)),
            onTap: () {
              // Update the state of the app.
              Navigator.of(context).pushNamed(LiveMatchPage.routeName);
              // ...
            },
          ),
          ListTile(
            selectedColor: Globals.colorGreen,
            title: const Text('Highlights',
                style: TextStyle(
                    fontFamily: "Montserrat-SemiBold",
                    color: Globals.colorGreen,
                    fontSize: 14)),
            onTap: () {
              Navigator.of(context).pushNamed(HighlightsScreen.routeName);
            },
          ),
          ListTile(
            selectedColor: Globals.colorGreen,
            title: const Text('Latest Events',
                style: TextStyle(
                    fontFamily: "Montserrat-SemiBold",
                    color: Globals.colorGreen,
                    fontSize: 14)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Fixtures',
                style: TextStyle(
                    fontFamily: "Montserrat-SemiBold",
                    color: Globals.colorGreen,
                    fontSize: 14)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Standings',
                style: TextStyle(
                    fontFamily: "Montserrat-SemiBold",
                    color: Globals.colorGreen,
                    fontSize: 14)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('News',
                style: TextStyle(
                    fontFamily: "Montserrat-SemiBold",
                    color: Globals.colorGreen,
                    fontSize: 14)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Settings',
                style: TextStyle(
                    fontFamily: "Montserrat-SemiBold",
                    color: Globals.colorGreen,
                    fontSize: 14)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Globals.colorGreen,
            ),
            title: const Text('Logout',
                style: TextStyle(
                    fontFamily: "Montserrat-SemiBold",
                    color: Globals.colorGreen,
                    fontSize: 14)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
