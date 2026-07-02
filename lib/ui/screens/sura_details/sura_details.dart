import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c19/ui/utils/app_assets.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';
import 'package:islami_c19/ui/utils/app_text_styles.dart';
import '../home/tabs/quran/sura_dm.dart';

class SuraDetails extends StatefulWidget {
  final SuraDM sura;

  SuraDetails({super.key, required this.sura});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String? suraContent = '';

  @override
  void initState() {
    super.initState();
    getSuraContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: AppColors.gold),
        ),
        title: Text(widget.sura.nameEn, style: AppTextStyles.gold20Bold),
        centerTitle: true,
        backgroundColor: AppColors.transparent,
      ),
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Image.asset(AppAssets.imgLeftCorner),
            Text(widget.sura.nameAr, style: AppTextStyles.gold20Bold,),
            Image.asset(AppAssets.imgRightCorner)
          ],),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [Container(
                    padding: EdgeInsets.all(8),
                    child: Center(child: Text(suraContent ?? '', style: AppTextStyles.gold20Bold, textDirection: TextDirection.rtl,)))],
              ),
            ),
          ),
          Image.asset(AppAssets.imgBottomDecoration)
        ],
      ),
    );
  }

  void getSuraContent() async {
    final String suraFilePath = 'assets/suras/${widget.sura.suraIndex + 1}.txt';
    try {
      suraContent = await rootBundle.loadString(suraFilePath);
      List<String> lines = suraContent!.split('\n');
      suraContent = '';
      int counter = 1;
      for (String line in lines) {
        if (line == '') continue;
        String newLine = "$line [$counter] ";
        suraContent = '$suraContent$newLine';
        counter++;
      }
      setState(() {});
    } on Exception catch (e) {
      print("Error on loading file $e");
    }
  }
}
