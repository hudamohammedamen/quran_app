import 'package:flutter/material.dart';
import 'package:quran_app/core/routes_manager.dart';
import 'package:quran_app/presentation/modules/home_module/tabs/quran_tab/quran_tab.dart';

class SuraNameWidget extends StatelessWidget {
  // String suraName;
  // String versesNumber;
  SuraItem suraItem;

  SuraNameWidget({super.key, required this.suraItem});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RoutesManager.quranDetailsRoute,
              arguments: suraItem);
        },
        child: Row(
          textDirection: TextDirection.rtl,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(suraItem.suraName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium)),
            Container(
              width: 2,
              color: Theme.of(context).dividerColor,
            ),
            Expanded(
                child: Text(
              suraItem.versesNumber,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            )),
          ],
        ),
      ),
    );
  }
}
