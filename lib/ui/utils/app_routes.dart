import 'package:flutter/material.dart';
import 'package:islami_c19/ui/screens/home/home_screen.dart';

abstract final class AppRoutes {
  static homeScreen() {
    return MaterialPageRoute(builder: (_) => HomeScreen());
    }
}