import 'dart:ui';

import 'package:bcb_live_app/pages/profile_page.dart';
import 'package:bcb_live_app/pages/schedule_page.dart';
import 'package:bcb_live_app/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widget/custom_bottom_widget.dart';
import '../custom_widget/main_appbar.dart';
import '../provider/home_provider.dart';
import 'highlight_content.dart';
import 'home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Scaffold(
          bottomNavigationBar: CustomBottomWidget(homeProvider: homeProvider),
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/BG-1.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  const MainAppbar(),
                  Expanded(
                    child: PageView(
                      controller: homeProvider.homePageController,
                      children: const [
                        HomeContent(),
                        HighLightContent(),
                        SchedulePage(),
                        ProfilePage()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  BackdropFilter _buildExitDialog(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: AlertDialog(
        backgroundColor: kGray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: const Text(
          'Please confirm',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Do you want to exit the app?',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(false),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text(
              'No',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            child: const Text(
              'Yes',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
