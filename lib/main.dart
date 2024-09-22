import 'package:flutter/material.dart';
import 'package:news/splash/splash_screen.dart';
import 'package:news/theme/my_theme_data.dart';

import 'home/pages/home_screen.dart';
import 'news/news_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      routes: {
        SplashScreen.routeName : (_)=> SplashScreen(),
        HomeScreen.routeName : (_)=> HomeScreen(),
        NewsDetails.routeName : (_) => NewsDetails()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
