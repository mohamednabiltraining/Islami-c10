import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c10/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () async {
                await settingsProvider.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: settingsProvider.isDarkModeEnabled()
                  ? getUnSelectedWidget(AppLocalizations.of(context)!.light)
                  : getSelectedWidget(AppLocalizations.of(context)!.light)),
          SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () async {
                await settingsProvider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: settingsProvider.isDarkModeEnabled()
                  ? getSelectedWidget(AppLocalizations.of(context)!.dark)
                  : getUnSelectedWidget(AppLocalizations.of(context)!.dark))
        ],
      ),
    );
  }

  Widget getSelectedWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        Icon(Icons.check, color: Theme.of(context).colorScheme.secondary),
      ],
    );
  }

  Widget getUnSelectedWidget(String text) {
    return Text(
      text,
    );
  }
}
