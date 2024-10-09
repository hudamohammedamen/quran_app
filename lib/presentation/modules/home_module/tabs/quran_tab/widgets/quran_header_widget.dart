import 'package:flutter/material.dart';

import '../../../../../../core/strings_manager.dart';

class QuranHeaderWidget extends StatelessWidget {
  const QuranHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(
        color: Theme.of(context).dividerColor,
        width: 2,
      ))),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                  textAlign: TextAlign.center,
                  StringsManager.chapterName,
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            Container(
              color: Theme.of(context).dividerColor,
              width: 4,
            ),
            Expanded(
                flex: 3,
                child: Text(
                  textAlign: TextAlign.center,
                  StringsManager.versesNumber,
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
          ],
        ),
      ),
    );
  }
}
