import 'package:flutter/material.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/sura_dm.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/sura_row.dart';
import 'package:islami_c19/ui/utils/app_assets.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';
import 'package:islami_c19/ui/utils/app_text_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.imgQuranBackground),
              fit: BoxFit.fill)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 25, child: Image.asset(AppAssets.islamiLogo)),
          buildSearchTextField(),
          SizedBox(
            height: 8,
          ),
          Text(
            "Suras list",
            style: AppTextStyles.white14Bold,
          ),
          Expanded(
            flex: 85,
            child: buildSurasList(),
          )
        ],
      ),
    );
  }

  buildSearchTextField() => TextField(
        decoration: InputDecoration(
            hintText: "Sura name",
            prefixIcon: Image.asset(
              AppAssets.icQuran,
              color: AppColors.gold,
            ),
            hintStyle: AppTextStyles.white16Bold,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.gold)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.gold))),
        cursorColor: AppColors.white,
        style: AppTextStyles.white16Bold,
      );

  buildSurasList() => ListView.separated(
        itemCount: 114,
        itemBuilder: (_, index) => SuraRow(
            suraDM: SuraDM(
                nameAr: "الفاتحه",
                nameEn: "Al-Fatiha",
                suraIndex: 1,
                verses: 7)),
        separatorBuilder: (_, index) => Divider(),
      );
}
