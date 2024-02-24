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
      create: (BuildContext context) => SettingsProvider(),
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
      theme: ThemeData(
        cardTheme: CardTheme(
            color: Colors.white,
            elevation: 12,
            surfaceTintColor: Colors.transparent),
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            centerTitle: true),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xFFB7935F),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            selectedIconTheme: IconThemeData(color: Colors.black, size: 32),
            unselectedIconTheme: IconThemeData(color: Colors.white)),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFB7935F),
          primary: Color(0xFFB7935F),
        ),
        useMaterial3: true,
        iconTheme: IconThemeData(
          color: Color(0xFFB7935F),
          size:50,
        ),
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        )
      ),
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
