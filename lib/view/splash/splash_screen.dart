import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/constant/app_images.dart';
import 'package:news_app/view/home/home_screeen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        body: SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.errorImage,
            height: height * .3,
            width: width * .8,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "T O P  H E A D L I N E S",
            style: textTheme.titleLarge!.copyWith(
              color: Colors.deepOrangeAccent,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Stay Updated",
            style: textTheme.displayMedium,
          ),
          const SpinKitChasingDots(
            color: Colors.red,
          ),
        ],
      ),
    ));
  }
}
