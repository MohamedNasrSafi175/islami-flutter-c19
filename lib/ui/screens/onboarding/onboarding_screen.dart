import 'package:flutter/material.dart';
import 'package:islamapp/ui/utilts/app_assets.dart';
import 'package:islamapp/ui/utilts/app_color.dart';
import 'package:islamapp/ui/utilts/app_font.dart';

import '../../utilts/app_route.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controllerPage = PageController();
  int index = 0;

  @override
  void dispose() {
    controllerPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                controller: controllerPage,
                children: [
                  buildFirstScreen(),
                  buildSecondScreen(),
                  buildThirdScreen(),
                  buildFourthScreen(),
                  buildFifthScreen(),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildAnimationDots(selected: index == 0),
                const SizedBox(width: 5),
                buildAnimationDots(selected: index == 1),
                const SizedBox(width: 5),
                buildAnimationDots(selected: index == 2),
                const SizedBox(width: 5),
                buildAnimationDots(selected: index == 3),
                const SizedBox(width: 5),
                buildAnimationDots(selected: index == 4),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  index != 0
                      ? TextButton(
                          onPressed: () {
                            controllerPage.animateToPage(
                              index - 1,
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            'Back',
                            style: AppStyle.gold20Bold.copyWith(fontSize: 16),
                          ),
                        )
                      : const SizedBox(width: 60),

                  TextButton(
                    onPressed: () {
                      if (index < 4) {
                        controllerPage.nextPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          AppRoute.homeRoute(),
                        );
                      }
                    },
                    child: Text(
                      index == 4 ? 'Finish' : 'Next',
                      style: AppStyle.gold20Bold.copyWith(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildFirstScreen() => Column(
  children: [
    Image.asset(AppAssets.islamiLogo),
    const SizedBox(height: 50),
    SizedBox(
      width: double.infinity,
      height: 320,
      child: Image.asset(AppAssets.firstIconOnboarding),
    ),
    const SizedBox(height: 40),
    const Text('Welcome to Islam App', style: AppStyle.gold24Bold),
  ],
);

Widget buildSecondScreen() => Column(
  children: [
    Image.asset(AppAssets.islamiLogo),
    const SizedBox(height: 40),
    SizedBox(
      width: double.infinity,
      height: 320,
      child: Image.asset(AppAssets.secondIconOnboarding),
    ),
    const SizedBox(height: 40),
    const Text('Welcome to Islam App', style: AppStyle.gold24Bold),
    const SizedBox(height: 40),
    const Text(
      'We Are Very Excited To Have You In Our Community',
      textAlign: TextAlign.center,
      style: AppStyle.gold20Bold,
    ),
  ],
);

Widget buildThirdScreen() => Column(
  children: [
    Image.asset(AppAssets.islamiLogo),
    const SizedBox(height: 50),
    SizedBox(
      width: double.infinity,
      height: 320,
      child: Image.asset(AppAssets.therdIconOnboarding),
    ),
    const SizedBox(height: 40),
    const Text('Reading the Quran', style: AppStyle.gold24Bold),
    const SizedBox(height: 40),
    const Text(
      'Read, and your Lord is the Most Generous',
      style: AppStyle.gold20Bold,
    ),
  ],
);

Widget buildFourthScreen() => Column(
  children: [
    Image.asset(AppAssets.islamiLogo),
    const SizedBox(height: 50),
    SizedBox(
      width: double.infinity,
      height: 320,
      child: Image.asset(AppAssets.fourdIconOnboarding),
    ),
    const SizedBox(height: 40),
    const Text('Bearish', style: AppStyle.gold24Bold),
    const SizedBox(height: 40),
    const Text(
      'Praise the name of your Lord, the Most High',
      textAlign: TextAlign.center,
      style: AppStyle.gold20Bold,
    ),
  ],
);

Widget buildFifthScreen() => Column(
  children: [
    Image.asset(AppAssets.islamiLogo),
    SizedBox(height: 50),
    SizedBox(
      width: double.infinity,
      height: 320,
      child: Image.asset(AppAssets.fivedIconOnboarding),
    ),
    SizedBox(height: 40),
    Text('Holy Quran Radio', style: AppStyle.gold24Bold),
    SizedBox(height: 40),
    Text(
      textAlign: .center,
      'You can listen to the Holy Quran Radio through the application for free and easily',
      style: AppStyle.gold20Bold,
    ),
  ],
);

Widget buildDots(bool selected) => AnimatedContainer(
  duration: Duration(milliseconds: 250),
  color: selected ? AppColor.goldColor : AppColor.whiteColor,
);

class buildAnimationDots extends StatelessWidget {
  const buildAnimationDots({super.key, required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: selected ? 24 : 10,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: selected ? AppColor.goldColor : AppColor.grayColor,
      ),
    );
  }
}
