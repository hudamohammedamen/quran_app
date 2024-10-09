import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/core/assets_manager.dart';
import 'package:quran_app/presentation/modules/home_module/screens/quran_details_screen/widgets/verse_widget.dart';

import '../../tabs/quran_tab/quran_tab.dart';

class QuranDetailsScreen extends StatefulWidget {
  QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraItem suraItem = ModalRoute.of(context)?.settings.arguments as SuraItem;
    if (verses.isEmpty) readQuranFile(suraItem.index + 1); //blocking thread

    return Stack(
      children: [
        Image.asset(
          AssetsManager.mainBgLight,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(suraItem.suraName),
          ),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (context, index) =>
                      VerseWidget(verse: verses[index]),
                  itemCount: verses.length),
        ),
      ],
    );
  }

  void readQuranFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/$index.txt'); //blocking
    //List<String> suraLinesList = fileContent.trim().split('\n');
    // suraLinesList.forEach((element){
    //   print(element);
    // },);
    setState(() {
      //verses = suraLinesList;
      verses = fileContent.trim().split('\n');
    });
  }

  void readQuranFileV2(int index) {
    rootBundle.loadString('assets/files/$index.txt').then(
      (fileContent) {
        verses = fileContent.trim().split('\n');
        setState(() {});
      },
    ); //blocking
    //List<String> suraLinesList = fileContent.trim().split('\n');
    // suraLinesList.forEach((element){
    //   print(element);
    // },);
  }
}
