import 'package:flutter/material.dart';
import 'package:islamapp/ui/screen/splash_screen.dart';

import '../screen/home/home_screen.dart';
// import '../screen/native_splash_screen.dart';
import '../screen/onboarding/onboarding_screen.dart';

abstract final class AppRoute {
  static homeRoute() => MaterialPageRoute(builder: (_) => HomeScreen());
  static splashRoute() => MaterialPageRoute(builder: (_) => SplashScreen());
  static onboardingRoute() =>
      MaterialPageRoute(builder: (_) => OnboardingScreen());
}
