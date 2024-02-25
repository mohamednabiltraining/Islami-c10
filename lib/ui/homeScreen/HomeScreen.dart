import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c10/providers/SettingsProvider.dart';
import 'package:islami_c10/ui/homeScreen/hadeth/HadethTab.dart';
import 'package:islami_c10/ui/homeScreen/quran/QuranTab.dart';
import 'package:islami_c10/ui/homeScreen/radio/RadioTab.dart';
import 'package:islami_c10/ui/homeScreen/settings/SettingsTab.dart';
import 'package:islami_c10/ui/homeScreen/tasbeh/TasbehTab.dart';
import 'package:provider/provider.dart';

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
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.getMainBackgroundImage()),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                  AppLocalizations.of(context)!.appTitle),
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
                    icon: const ImageIcon(AssetImage('assets/images/ic_moshaf.png')),
                    label: AppLocalizations.of(context)!.quran_tab),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).primaryColor,
                    icon: const ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                    label: AppLocalizations.of(context)!.hadeth_tab),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).primaryColor,
                    icon: const ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                    label: AppLocalizations.of(context)!.tasbeh_tab),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).primaryColor,
                    icon: const ImageIcon(AssetImage('assets/images/ic_radio.png')),
                    label: AppLocalizations.of(context)!.radio_tab),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).primaryColor,
                    icon: const Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings_tab),
              ],
            ),
            body: tabs[selectedTabIndex]));
  }

  var tabs = [const QuranTab(), const HadethTab(), const TasbehTab(), const RadioTab(), const SettingsTab()];
}
