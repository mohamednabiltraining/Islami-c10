import 'package:flutter/material.dart';
import 'package:islami_c10/ui/chapterDetails/ChapterDetailsScreen.dart';
import 'package:islami_c10/ui/homeScreen/HomeScreen.dart';
import 'package:islami_c10/ui/splash/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
            labelMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
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
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        ChapterDetailsScreen.routeName: (_) => ChapterDetailsScreen()
      },
    );
  }
}
