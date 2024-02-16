import 'package:flutter/material.dart';
import 'package:islami_c10/ui/homeScreen/hadeth/HadethTab.dart';
import 'package:islami_c10/ui/homeScreen/quran/QuranTab.dart';
import 'package:islami_c10/ui/homeScreen/radio/RadioTab.dart';
import 'package:islami_c10/ui/homeScreen/tasbeh/tasbeh_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
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
              title: Text(
                "Islami",
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedTabIndex,
              onTap: (index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).primaryColor,
                    icon: ImageIcon(AssetImage('assets/images/ic_moshaf.png')),
                    label: 'Quran'),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).primaryColor,
                    icon: ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                    label: 'Hadeth'),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).primaryColor,
                    icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                    label: 'Tasbeh'),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).primaryColor,
                    icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
                    label: 'Radio'),
              ],
            ),
            body: tabs[selectedTabIndex]));
  }

  var tabs = [QuranTab(), HadethTab(), TasbehTab(), RadioTab()];
}
