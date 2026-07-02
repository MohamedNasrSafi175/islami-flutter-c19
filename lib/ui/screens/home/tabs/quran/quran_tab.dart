import 'package:flutter/material.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/sura_dm.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/sura_row.dart';
import 'package:islami_c19/ui/utils/app_assets.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';
import 'package:islami_c19/ui/utils/app_constants.dart';
import 'package:islami_c19/ui/utils/app_routes.dart';
import 'package:islami_c19/ui/utils/app_text_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.imgQuranBackground),
          fit: BoxFit.fill,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 25, child: Image.asset(AppAssets.islamiLogo)),
          buildSearchTextField(),
          SizedBox(height: 8),
          Text("Most Recently", style: AppTextStyles.white14Bold),
          Container(
            height: MediaQuery.of(context).size.height * .18,
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  buildMostRecentItem(context, suras[index]),
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 8),
          Text("Suras list", style: AppTextStyles.white14Bold),
          Expanded(flex: 85, child: buildSurasList()),
        ],
      ),
    );
  }

  buildSearchTextField() => TextField(
    decoration: InputDecoration(
      hintText: "Sura name",
      prefixIcon: Image.asset(AppAssets.icQuran, color: AppColors.gold),
      hintStyle: AppTextStyles.white16Bold,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.gold),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.gold),
      ),
    ),
    cursorColor: AppColors.white,
    style: AppTextStyles.white16Bold,
  );

  buildSurasList() => ListView.separated(
    itemCount: suras.length,
    itemBuilder: (context, index) => InkWell(
      onTap: () {
        Navigator.push(context, AppRoutes.suraDetailsScreen(suras[index]));
      },
      child: SuraRow(suraDM: suras[index]),
    ),
    separatorBuilder: (_, index) => Divider(),
  );
}

Widget buildMostRecentItem(BuildContext context, SuraDM sura) {
  return Container(
    width: MediaQuery.of(context).size.width * .7,
    decoration: BoxDecoration(
      color: AppColors.gold,
      borderRadius: BorderRadius.circular(16),
      image: DecorationImage(
        image: AssetImage(AppAssets.imgMostRecent),
        alignment: AlignmentDirectional.centerEnd,
      ),
    ),
    child: Expanded(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(sura.nameEn, style: AppTextStyles.black24Bold,),
      Text(sura.nameAr, style: AppTextStyles.black24Bold,),
      Text("${sura.verses} Verses", style: AppTextStyles.black16Bold,),
    ],)),
  );
}
