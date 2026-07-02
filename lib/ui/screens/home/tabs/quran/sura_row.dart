import 'package:flutter/material.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/sura_dm.dart';
import 'package:islami_c19/ui/utils/app_assets.dart';
import 'package:islami_c19/ui/utils/app_text_styles.dart';

class SuraRow extends StatelessWidget {
  final SuraDM suraDM;

  const SuraRow({super.key, required this.suraDM});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              buildSuraIndex(),
              SizedBox(
                width: 24,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      suraDM.nameEn,
                      style: AppTextStyles.white20Bold,
                    ),
                    Text("Verses ${suraDM.verses}",
                        style: AppTextStyles.white16Bold)
                  ],
                ),
              ),
              Text(
                suraDM.nameAr,
                style: AppTextStyles.white20Bold,
              )
            ],
          )
        ],
      ),
    );
  }

  buildSuraIndex() => Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(AppAssets.imgSuraNumberFrame))),
      child: Center(
        child: Text(
          "${suraDM.suraIndex}",
          style: AppTextStyles.white14Bold,
        ),
      ));
}
