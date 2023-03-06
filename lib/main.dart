import 'dart:ffi';

import 'package:expenses_tracker/onboarding/onboarding_main.dart';
import 'package:expenses_tracker/onboarding/onboarding_page_modal.dart';
import 'package:expenses_tracker/utility/storager_helper.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() async {
  StorageHelper().initDatabase();
  String token = await StorageHelper().getToken();
  runApp(MyApp(isUserLoggedIn: !token.isEmpty));
}

class MyApp extends StatelessWidget {
  final bool isUserLoggedIn;
  const MyApp({super.key, required this.isUserLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Inter'),
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: SvgPicture.asset('assets/images/app_icon.svg',
                height: 100, width: 100),
            nextScreen: OnboardingMain(),
            splashTransition: SplashTransition.rotationTransition,
            backgroundColor: Colors.transparent));
  }
}
