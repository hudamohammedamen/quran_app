import 'package:flutter/material.dart';

import '../hadith_tab.dart';

class HadithTitleWidget extends StatelessWidget {
  Hadith hadith;

  HadithTitleWidget({super.key, required this.hadith});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: Text(
        hadith.title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
