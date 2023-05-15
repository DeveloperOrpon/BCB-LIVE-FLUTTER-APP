import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bcb_live_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: "https://lyknfaiyybiqhajeijfi.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx5a25mYWl5eWJpcWhhamVpamZpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQwMDAwNzIsImV4cCI6MTk5OTU3NjA3Mn0.RWpI2lgWZ-_QPCgq1aLgEya5iXDWHAjdHuZovzgvLqI");

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xff1a1726),
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      title: "BCB Live",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.soraTextTheme(),
        scaffoldBackgroundColor: const Color(0xff1a1726),
      ),
      home: AnimatedSplashScreen(
        curve: Curves.easeInOut,
        pageTransitionType: PageTransitionType.rightToLeftWithFade,
        splash: 'assets/images/Logo-gif-4.gif',
        splashTransition: SplashTransition.scaleTransition,
        splashIconSize: 150,
        backgroundColor: Colors.black,
        nextScreen: const HomePage(),
      ),
      builder: EasyLoading.init(),
    );
  }
}
