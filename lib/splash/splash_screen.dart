import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../custom_bg.dart';
import '../home/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomBg(
         child: Scaffold(
           backgroundColor: Colors.transparent,
        body: Center(
          child: ZoomIn(
            duration: Duration(seconds: 2),
              child: Image.asset("assets/logo.png")),
        ),
      ),
    );
  }
}
