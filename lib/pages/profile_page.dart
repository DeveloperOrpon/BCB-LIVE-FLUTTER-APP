import 'package:entry/entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_const.dart';
import '../utils/testStyle.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: CupertinoButton(
              color: appPrimary,
              borderRadius: BorderRadius.circular(20),
              onPressed: () {
                Get.to(const LoginPage(), transition: Transition.cupertino);
              },
              child: Text(
                "LOGIN",
                style: whiteBoldText,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Divider(
            color: Colors.grey,
            height: 2,
          ),
        ),
        const SizedBox(height: 15),
        ListTile(
          tileColor: Colors.blue,
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: appPrimary.withOpacity(.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Entry(
              opacity: .5,
              angle: 3.1415,
              scale: .5,
              delay: Duration(milliseconds: 300),
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
              child: Icon(
                Icons.settings,
                color: appPrimary,
              ),
            ),
          ),
          title: Entry(
            delay: const Duration(milliseconds: 300),
            duration: const Duration(milliseconds: 300),
            opacity: 0,
            curve: Curves.easeInOutCubic,
            child: Text(
              "Settings",
              style: whiteBoldText,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
          ),
        ),
        ListTile(
          tileColor: Colors.grey.shade200,
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: appPrimary.withOpacity(.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Entry(
              opacity: .5,
              angle: 3.1415,
              scale: .5,
              delay: Duration(milliseconds: 400),
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
              child: Icon(
                Icons.garage_outlined,
                color: appPrimary,
              ),
            ),
          ),
          title: Entry(
            delay: const Duration(milliseconds: 400),
            duration: const Duration(milliseconds: 300),
            opacity: 0,
            curve: Curves.easeInOutCubic,
            child: Text(
              "Parking Details",
              style: whiteBoldText,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
          ),
        ),
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: appPrimary.withOpacity(.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Entry(
              opacity: .5,
              angle: 3.1415,
              scale: .5,
              delay: Duration(milliseconds: 500),
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
              child: Icon(
                Icons.verified_user,
                color: appPrimary,
              ),
            ),
          ),
          title: Entry(
            delay: const Duration(milliseconds: 500),
            duration: const Duration(milliseconds: 300),
            opacity: 0,
            curve: Curves.easeInOutCubic,
            child: Text(
              "Privacy & Policy",
              style: whiteBoldText,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
          ),
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Divider(
            color: Colors.grey,
            height: 2,
          ),
        ),
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: appPrimary.withOpacity(.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Entry(
              opacity: .5,
              angle: 3.1415,
              scale: .5,
              delay: Duration(milliseconds: 600),
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
              child: Icon(
                Icons.info,
                color: appPrimary,
              ),
            ),
          ),
          title: Entry(
            delay: const Duration(milliseconds: 600),
            duration: const Duration(milliseconds: 300),
            opacity: 0,
            curve: Curves.easeInOutCubic,
            child: Text(
              "Information",
              style: whiteBoldText,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
          ),
        ),
        ListTile(
          onTap: () {},
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: appPrimary.withOpacity(.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Entry(
              opacity: .5,
              angle: 3.1415,
              scale: .5,
              delay: Duration(milliseconds: 700),
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
              child: Icon(
                Icons.logout,
                color: appPrimary,
              ),
            ),
          ),
          title: Entry(
            delay: const Duration(milliseconds: 700),
            duration: const Duration(milliseconds: 300),
            opacity: 0,
            curve: Curves.easeInOutCubic,
            child: Text(
              "LogOut",
              style: whiteBoldText,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
