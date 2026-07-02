import 'package:flutter/material.dart';
import 'package:islami_c19/ui/screens/home/home_screen.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/sura_dm.dart';
import 'package:islami_c19/ui/screens/sura_details/sura_details.dart';

abstract final class AppRoutes {
  static homeScreen() {
    return MaterialPageRoute(builder: (_) => HomeScreen());
    }

    static suraDetailsScreen(SuraDM sura) {
    return MaterialPageRoute(builder: (_) => SuraDetails(sura: sura));
    }
}