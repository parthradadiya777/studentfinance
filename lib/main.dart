import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student/screens/onboarding/onboarding_screen.dart';
import 'package:student/theme/app-theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(16, 27, 49, 1.0),
          textTheme: GoogleFonts.interTextTheme(Theme.of(context)
              .textTheme
              .apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                  decorationColor: Colors.white)),
          primarySwatch: AppTheme.primary,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(), onPrimary: Colors.white))),
      home: OnBoardingScreen(),
    );
  }
}
