import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/core/assets_manager.dart';
import 'package:quran_app/presentation/modules/home_module/tabs/hadith_tab/widgets/hadith_header_widget.dart';
import 'package:quran_app/presentation/modules/home_module/tabs/hadith_tab/widgets/hadith_title_widget.dart';

class HadithTab extends StatelessWidget {
  HadithTab({super.key});

  List<Hadith> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) readHadithFile();
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 1, child: Image.asset(AssetsManager.hadithHeaderImage)),
          HadithHeaderWidget(),
          Expanded(
            flex: 3,
            child: hadithList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Theme.of(context).dividerColor,
                          thickness: 3,
                          height: 0,
                        ),
                    itemBuilder: (context, index) =>
                        HadithTitleWidget(hadith: hadithList[index]),
                    itemCount: hadithList.length),
          )
        ],
      ),
    );
  }

  readHadithFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadithItemList = fileContent.trim().split('#');

    for (int i = 0; i < hadithItemList.length; i++) {
      String hadithItem = hadithItemList[i];
      List<String> hadithLines = hadithItem.trim().split('\n');
      String title = hadithLines[0];
      hadithLines.removeAt(0);
      String content = hadithLines.join('\n');
      Hadith hadith = Hadith(title: title, content: content);
      hadithList.add(hadith);
    }

    // String hadithItem = hadithItemList[0];
    // List<String> hadithLines = hadithItem.split ('\n');
    // String title = hadithItemList[0];
    // hadithLines.removeAt(0);
    // String content = hadithLines.join('\n');
    // print(title);
    // print(content);
  }
}

class Hadith {
  String title;
  String content;

  Hadith({required this.title, required this.content});
}
