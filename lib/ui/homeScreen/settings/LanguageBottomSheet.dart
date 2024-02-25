import 'package:flutter/material.dart';
import 'package:islami_c10/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                settingsProvider.changeLanguage("en");
                Navigator.pop(context);
              },
              child: settingsProvider.selectedLocale == "en"
                  ? getSelectedWidget("English")
                  : getUnSelectedWidget("English")),
          const SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                settingsProvider.changeLanguage("ar");
                Navigator.pop(context);
              },
              child: settingsProvider.selectedLocale == "ar"
                  ? getSelectedWidget("العربيه")
                  : getUnSelectedWidget("العربيه"))
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
