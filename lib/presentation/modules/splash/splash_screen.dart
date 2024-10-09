import 'package:flutter/material.dart';
import 'package:quran_app/core/assets_manager.dart';
import 'package:quran_app/core/routes_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
      },
    ); //non blocking
    return Scaffold(
      body: Image.asset(
        AssetsManager.lightSplashScreen,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
