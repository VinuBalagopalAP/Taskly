import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taskly/app/theme/app_theme.dart';

class SplashScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  // animation controller for lottie
  AnimationController animationController;

  // initializing userData instance
  final userData = GetStorage();

  // list of available in the respective order of app theme in theme/app_theme.dart
  var themes = [
    "Yellow Light",
    "Yellow Dark",
    "Red Light",
    "Red Dark",
    "Teal Light",
    "Teal Dark",
    "Green Light",
    "Green Dark",
  ];

  // function to set the user saved theme on start
  setTheme() {
    int n = themes.indexOf(userData.read('theme'));
    Get.changeTheme(appThemeData.values.elementAt(n));
  }

  @override
  void onInit() {
    userData.writeIfNull('theme', "Yellow Light");
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    Timer(
      Duration(milliseconds: 8200),
      () => Get.offNamed('/home'),
    );
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await setTheme();
  }

  @override
  void onClose() async {
    animationController.dispose();
    super.onClose();
  }
}