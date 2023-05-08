import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

startLoading(String text) async {
  await EasyLoading.show(
      dismissOnTap: false,
      status: text,
      indicator: Image.asset('assets/images/Logo-gif-4.gif',
          width: 80, height: 60, fit: BoxFit.contain));
}
