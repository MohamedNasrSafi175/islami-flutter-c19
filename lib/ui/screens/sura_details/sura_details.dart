import 'package:flutter/material.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';
import 'package:islami_c19/ui/utils/app_text_styles.dart';
import '../home/tabs/quran/sura_dm.dart';

class SuraDetails extends StatelessWidget {
  final SuraDM sura;

  const SuraDetails({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: AppColors.gold,),
        title: Text(sura.nameEn, style: AppTextStyles.gold20Bold,),
        centerTitle: true,
        backgroundColor: AppColors.transparent,
      ),
      backgroundColor: AppColors.black,
        body: SingleChildScrollView(child: Column(children: [Text(sura.)],
        ),));
  }
}
