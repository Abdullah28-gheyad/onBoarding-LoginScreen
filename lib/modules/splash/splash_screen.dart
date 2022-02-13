import 'dart:async';

import 'package:advancedcourse/modules/onboard/onboard_screen.dart';
import 'package:advancedcourse/shared/components/navigator.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 2),
            () =>
            navigateToAndReplacement(context, OnBoardingScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Image(
          height: 150,
          width: 150,
          image:  AssetImage('assets/images/splash_logo.png'),
        ),
      ),
    );
  }
}
