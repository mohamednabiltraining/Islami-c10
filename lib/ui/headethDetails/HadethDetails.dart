import 'package:flutter/material.dart';
import 'package:islami_c10/ui/homeScreen/hadeth/Hadeth.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth-details';

  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hadeth = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/main_background.jpg",
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("${hadeth.title}"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 64),
          child: Card(
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Text(
                  "${hadeth.content}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
