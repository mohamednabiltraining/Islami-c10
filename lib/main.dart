import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c10/providers/SettingsProvider.dart';
import 'package:islami_c10/ui/MyThemeData.dart';
import 'package:islami_c10/ui/chapterDetails/ChapterDetailsScreen.dart';
import 'package:islami_c10/ui/headethDetails/HadethDetails.dart';
import 'package:islami_c10/ui/homeScreen/HomeScreen.dart';
import 'package:islami_c10/ui/splash/SplashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => SettingsProvider()..LoadSettingsData(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.light,
      darkTheme: MyThemeData.dark,
      themeMode: settingsProvider.selectedTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
        ChapterDetailsScreen.routeName: (_) => ChapterDetailsScreen()
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.selectedLocale),
    );
  }
}
