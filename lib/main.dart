import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/providers/highlights_provider.dart';
import 'package:untitled1/screens/Live_Match_Page.dart';
import 'package:untitled1/screens/auth_screen.dart';
import 'package:untitled1/screens/highlights_screen.dart';
import 'package:untitled1/screens/home_screen.dart';

import 'constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Animate.restartOnHotReload = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Highlights()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: const TextTheme(
                bodyMedium: TextStyle(
                    fontFamily: "Montserrat-Medium",
                    color: Globals.colorGreen,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                titleLarge: TextStyle(
                    fontFamily: "Montserrat-ExtraBold",
                    color: Globals.colorGreen,
                    fontSize: 18),
                bodySmall: TextStyle(
                  fontFamily: "NewsGothicStd",
                  fontSize: 9
                )
            ),
            primarySwatch: Colors.blue,
          ),
          routes: {
            HighlightsScreen.routeName: (context) => const HighlightsScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            LoginSignupPage.routeName: (context) => LoginSignupPage(),
            LiveMatchPage.routeName: (context) => const LiveMatchPage()
          },
          home: const HomeScreen()),
    );
  }
}
