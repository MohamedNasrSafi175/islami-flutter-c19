import 'package:flutter/material.dart';
import 'package:islami_c19/ui/screens/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_c19/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_c19/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_c19/ui/screens/home/tabs/times/times_tab.dart';
import 'package:islami_c19/ui/utils/app_assets.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimesTab()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[selectedIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  buildBottomNavigationBar() => BottomNavigationBar(
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.black,
          iconSize: 34,
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: buildBottomNavIcon(AppAssets.icQuran, selectedIndex == 0),
                label: "Quran"),
            BottomNavigationBarItem(
                icon:
                    buildBottomNavIcon(AppAssets.icHadeth, selectedIndex == 1),
                label: "Hadeth"),
            BottomNavigationBarItem(
                icon: buildBottomNavIcon(AppAssets.icRadio, selectedIndex == 2),
                label: "Radio"),
            BottomNavigationBarItem(
                icon: buildBottomNavIcon(AppAssets.icSebha, selectedIndex == 3),
                label: "Sebha"),
            BottomNavigationBarItem(
                icon: buildBottomNavIcon(AppAssets.icTime, selectedIndex == 4),
                label: "Times"),
          ]);

  Widget buildBottomNavIcon(String imagePath, bool isSelected) => Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color:
              isSelected ? AppColors.black.withAlpha(153) : Colors.transparent),
      child: ImageIcon(AssetImage(imagePath)));
}
