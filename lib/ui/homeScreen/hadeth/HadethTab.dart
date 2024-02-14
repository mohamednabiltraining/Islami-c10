import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c10/ui/homeScreen/hadeth/Hadeth.dart';
import 'package:islami_c10/ui/homeScreen/hadeth/HadethTitleWidget.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> allHadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allHadeth.isEmpty) loadHadethFile();
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Image.asset("assets/images/hadeth_header_image.png")),
        Expanded(
          flex: 3,
          child: Container(
            child: allHadeth.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return HadethTitleWidget(allHadeth[index]);
                    },
                    itemCount: allHadeth.length,
                    separatorBuilder: (_, __) => Container(
                      height: 1,
                      width: double.infinity,
                      color: Theme.of(context).primaryColor,
                      margin: EdgeInsets.symmetric(horizontal: 64),
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  void loadHadethFile() async {
    String fileContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allAhadethContent = fileContent.trim().split("#");
    for (int i = 0; i < allAhadethContent.length; i++) {
      String singleHadethContent = allAhadethContent[i].trim();
      String title =
          singleHadethContent.substring(0, singleHadethContent.indexOf("\n"));
      String content =
          singleHadethContent.substring(singleHadethContent.indexOf("\n") + 1);
      Hadeth hadeth = Hadeth(title, content);
      allHadeth.add(hadeth);
    }
    setState(() {});
  }
}
