import 'dart:async';

import 'package:crud_gerick/pages/export_pages.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreenPage extends StatefulWidget {
const SplashScreenPage({super.key});
  static Route route() {
  return MaterialPageRoute<void>(builder: (_) => const SplashScreenPage());
  }

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}


class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
  super.initState();
     Timer(const Duration(seconds: 5), () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const DashBoardPages(),))
      );  
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: Lottie.network(
        'https://assets4.lottiefiles.com/packages/lf20_4KT4dCbI5T.json',
        frameRate: FrameRate.max,
        width: 300,
        height: 300
        )
      ),
    );
  }
}