import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      body: Center(
        child: Image.asset(AssetHelper.splash,scale: 2),
      ),
    );
  }
}
