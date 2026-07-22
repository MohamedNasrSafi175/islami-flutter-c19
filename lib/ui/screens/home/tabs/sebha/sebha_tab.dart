import 'package:flutter/material.dart';
import 'package:islamapp/ui/utilts/app_assets.dart';

import '../../../utilts/app_font.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
     int counterSebha = 0 ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.quranBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(crossAxisAlignment: .stretch,
          children: [
            Image.asset(AppAssets.islamiLogo),
            SizedBox(height: 16),
            Center(child: Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى', style: AppStyle.white20Bold)),
            SizedBox(height: 16),
        Stack(
      
          children: [
                Positioned( bottom: 200, left: 135,child: Text('سبحان الله' , style: AppStyle.white20Bold.copyWith(fontSize: 36),)),
                Positioned( bottom: 130, left: 188,child: Text('${counterSebha}' , style: AppStyle.white20Bold.copyWith(fontSize: 36),)),
            Center(
              child: InkWell(
      
                  onTap: (){
                setState(() {
                  counterSebha++;
                });
      
              }, child: Image.asset(AppAssets.icSebha)),
            ),
          ],
        ) ,
      
          ],
        ),
      ),
    );
  }
}
