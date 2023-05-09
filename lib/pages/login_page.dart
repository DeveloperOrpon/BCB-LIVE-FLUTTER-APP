import 'dart:developer';

import 'package:bcb_live_app/utils/app_const.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../custom_widget/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Form(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    appLogo,
                    height: 90,
                    fit: BoxFit.contain,
                  )
                      .animate(
                        delay: 0.ms,
                        onPlay: (controller) => controller.repeat(),
                      )
                      .shimmer(
                        duration: const Duration(seconds: 2),
                      ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    labelText: "Enter Phone Number",
                    hintText: "Enter Your Phone Number",
                    keyboardType: TextInputType.phone,
                    prefixIcon: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.phone,
                      ),
                    ),
                  ),
                  //   verticalSpace(20.0),

                  /// password TextField
                  CustomTextField(
                    hintText: 'Password',
                    obscureText: false,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: const Icon(
                        true ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    prefixIcon: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.lock,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Forgot Password?',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              log("Forget Password");
                            },
                          style: const TextStyle(
                              color: Colors.amber, fontWeight: FontWeight.bold),
                        ),
                      ]),
                      textAlign: TextAlign.right,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: appPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        )),
                    onPressed: () {},
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: 'Have not any account? ', style: TextStyle()),
                    TextSpan(
                      text: "Signup",
                      recognizer: TapGestureRecognizer()..onTap = () async {},
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    )
                  ])),
                ],
              ),
            ),
          ),
        ));
  }
}
