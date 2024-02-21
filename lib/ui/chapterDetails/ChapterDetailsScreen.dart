import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c10/providers/SettingsProvider.dart';
import 'package:islami_c10/ui/chapterDetails/verseItem.dart';
import 'package:provider/provider.dart';

class ChapterDetailsScreen extends StatefulWidget {
  static const String routeName = "chapter-details";

  ChapterDetailsScreen({super.key});

  @override
  State<ChapterDetailsScreen> createState() => _ChapterDetailsScreenState();
}

class _ChapterDetailsScreenState extends State<ChapterDetailsScreen> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    ChapterDetailsScreenArgs args =
        ModalRoute.of(context)?.settings.arguments as ChapterDetailsScreenArgs;

    if (versesList.isEmpty) loadChapter(args.index);
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                provider.getMainBackgroundImage(),
              ),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.title),
          ),
          body: versesList.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Container(
                  margin: EdgeInsets.symmetric(vertical: 64, horizontal: 12),
                  child: Card(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return VerseItem(versesList[index]);
                      },
                      itemCount: versesList.length,
                      separatorBuilder: (_, __) => Container(
                        height: 1,
                        width: double.infinity,
                        color: Theme.of(context).primaryColor,
                        margin: EdgeInsets.symmetric(horizontal: 64),
                      ),
                    ),
                  ),
                ),
        ));
  }

  void loadChapter(int index) async {
    String fileContent =
        await rootBundle.loadString("assets/files/${index}.txt");
    List<String> lines = fileContent.trim().split("\n");
    setState(() {
      versesList = lines;
    });
  }
}

class ChapterDetailsScreenArgs {
  int index;
  String title;

  ChapterDetailsScreenArgs(this.index, this.title);
}
