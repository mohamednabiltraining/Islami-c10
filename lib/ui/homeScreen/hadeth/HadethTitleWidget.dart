import 'package:flutter/material.dart';
import 'package:islami_c10/ui/headethDetails/HadethDetails.dart';
import 'package:islami_c10/ui/homeScreen/hadeth/Hadeth.dart';

class HadethTitleWidget extends StatelessWidget {
  Hadeth hadeth;

  HadethTitleWidget(this.hadeth, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.routeName, arguments: hadeth);
      },
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            hadeth.title,
            style: Theme.of(context).textTheme.titleMedium,
          )),
    );
  }
}
