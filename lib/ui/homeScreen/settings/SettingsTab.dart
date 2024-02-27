import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c10/providers/SettingsProvider.dart';
import 'package:islami_c10/ui/homeScreen/settings/LanguageBottomSheet.dart';
import 'package:islami_c10/ui/homeScreen/settings/ThemeBottomSheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary, width: 1),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(settingsProvider.getSelectedLocaleName()),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(AppLocalizations.of(context)!.theme),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary, width: 1),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(settingsProvider.isDarkModeEnabled()
                  ? AppLocalizations.of(context)!.dark
                  : AppLocalizations.of(context)!.light),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (buildContext) => LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (buildContext) => ThemeBottomSheet());
  }

}
